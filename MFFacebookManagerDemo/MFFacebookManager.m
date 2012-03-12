//
//  MFFacebookManager.m
//  MyFamilio
//
//  Created by Iftach Orr 4/11/2011
//  Copyright 2011 MyFamilio, Inc. All rights reserved.
//

#import "MFFacebookManager.h"

static MFFacebookManager *_sharedManager;

@interface MFFacebookManager(private)


@end

@implementation MFFacebookManager
@synthesize facebook, permissionsArray;


+ (MFFacebookManager *)sharedManagerWithAppID:(NSString *) facebookAppId andPermissionsArray:(NSArray *) permissions;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
		_sharedManager = [[MFFacebookManager alloc] initWithAppID:facebookAppId];
        _sharedManager.permissionsArray = permissions;
	});
	return _sharedManager;    
}

+ (MFFacebookManager *)sharedManager
{
	return _sharedManager;
}

- (id)initWithAppID:(NSString *) facebookAppId
{
	if (self = [super init]) 
	{
        facebook = [[Facebook alloc] initWithAppId:facebookAppId andDelegate:self];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"FBAccessTokenKey"] 
            && [defaults objectForKey:@"FBExpirationDateKey"]) {
            facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
            facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
        }
	}
    
	return self;
}

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    [facebook requestWithGraphPath:@"me" andDelegate:self];
}

- (void)fbDidNotLogin:(BOOL)cancelled
{
    NSLog(@"fbDidNotLogin:");
}

- (void)fbDidExtendToken:(NSString*)accessToken expiresAt:(NSDate*)expiresAt
{
    NSLog(@"fbDidExtendToken:expiresAt:");
}

-(BOOL) isConnectedWithFacebook
{
    if(facebook.accessToken && facebook.expirationDate)
    {
        return YES;
    }
    else 
    {
        return NO;
    }
}



-(void) renewFacebookConnect
{
    if (![facebook isSessionValid]) {
        NSLog(@"Trying to authorize");
        [facebook authorize:self.permissionsArray];
    }
    else {
        NSLog(@"Already authorized");
    }
}


#pragma mark - Facebook Delegate

/**
 * Called just before the request is sent to the server.
 */
- (void)requestLoading:(FBRequest *)request
{
    NSLog(@"requestLoading:");
}

/**
 * Called when the server responds and begins to send back data.
 */
- (void)request:(FBRequest *)request didReceiveResponse:(NSURLResponse *)response
{
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    if (statusCode == 200) 
    {
        // Do Something?
    }
    else
    {
        // Do Something?
    }
    
}

/**
 * Called when an error prevents the request from completing successfully.
 */
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"ERROR fetching request from Facebook %@",[error localizedDescription]);
}

/**
 * Called when a request returns and its response has been parsed into
 * an object.
 *
 * The resulting object may be a dictionary, an array, a string, or a number,
 * depending on thee format of the API response.
 */
- (void)request:(FBRequest *)request didLoad:(id)result
{
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSDictionary *finalResult = (NSDictionary *) result;
        NSLog(@"The response from Facebook servers: %@",finalResult);
        NSString *requestString = [request url];
        NSLog(@"Request url was %@",requestString);
        if(requestString)
        {
            NSString *firstName = [finalResult objectForKey:@"first_name"] ? [finalResult objectForKey:@"first_name"] : @"unknown";
            NSString *lastName = [finalResult objectForKey:@"last_name"] ? [finalResult objectForKey:@"last_name"] : @"unknown";
            NSString *email = [finalResult objectForKey:@"eamil"] ? [finalResult objectForKey:@"eamil"] : @"unknown";
            NSString *facebookId = [finalResult objectForKey:@"id"] ? [finalResult objectForKey:@"id"] : @"unknown";
            //[YourServerApiCaller facebookConnectFirstName:firstName lastName:lastName email:email facebookId:facebookId];
        }
    }
    else if ([result isKindOfClass:[NSArray class]])
    {
        
    }
    else if ([result isKindOfClass:[NSString class]])
    {
        
    }
}

/**
 * Called when a request returns a response.
 *
 * The result object is the raw response from the server of type NSData
 */
- (void)request:(FBRequest *)request didLoadRawResponse:(NSData *)data
{
    NSLog(@"request:didLoadRawResponse:");
}


@end