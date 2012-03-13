//
//  MFFacebookManager.h
//  MyFamilio
//
//  Created by Iftach Orr 4/11/2011
//  Copyright 2011 MyFamilio, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"

// This is defined at your developer facebook app.  fb<your facebook app ID>
// Notice: You need to define this at your info.plist as well, under 'URL types'.

@interface MFFacebookManager : NSObject <FBSessionDelegate, FBRequestDelegate>{

    Facebook *facebook;
    NSArray *permissionsArray;
    NSString *appId;

}
@property (nonatomic, readonly) Facebook *facebook;
@property (nonatomic, retain) NSArray *permissionsArray;

// This will return nil until sharedManagerWithAppID: andPermissionsArray: was called for the first time.
+ (MFFacebookManager *)sharedManager;

+ (MFFacebookManager *)sharedManagerWithAppID:(NSString *) facebookAppId andPermissionsArray:(NSArray *) permissions;

-(void) renewFacebookConnect;

-(BOOL) isConnectedWithFacebook;

-(BOOL) handleOpenURL:(NSURL *) url;



@end
