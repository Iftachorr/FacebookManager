//
//  MFAppDelegate.m
//  MFFacebookManagerDemo
//
//  Created by admin on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MFAppDelegate.h"

#import "MFViewController.h"
#import "MFFacebookManager.h"

@implementation MFAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;










/************************************************************/
/************************************************************/
/************************************************************/
// This is defined at your developer facebook app.  fb<your facebook app ID>
// Notice: You need to define this at your info.plist as well, under 'URL types'.
#define FACEBOOK_APP_URL_SCHEME @"fb123123123123123"
// iOS < 4.2
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if([[url absoluteString] hasPrefix:FACEBOOK_APP_URL_SCHEME])
    {
        [[MFFacebookManager sharedManager].facebook handleOpenURL:url];
    }
    else 
    {
        // Do something else
        
    }
    
    return YES;    
}
// iOS > 4.2
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([[url absoluteString] hasPrefix:FACEBOOK_APP_URL_SCHEME])
    {
        [[MFFacebookManager sharedManager].facebook handleOpenURL:url];
    }
    else 
    {
        // Do something else
        
    }
    
    return YES;    
}
/************************************************************/
/************************************************************/
/************************************************************/








- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[MFViewController alloc] initWithNibName:@"MFViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
