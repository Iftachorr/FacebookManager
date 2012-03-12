//
//  MFViewController.m
//  MFFacebookManagerDemo
//
//  Created by admin on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MFViewController.h"
#import "MFFacebookManager.h"

@interface MFViewController ()

@end

@implementation MFViewController

- (void)viewDidLoad
{
    /************************************************************/
    // initializing it for the first time...
    NSArray *permissionsArray = [NSArray arrayWithObjects:@"user_birthday",@"email",@"user_relationships", nil];
    [MFFacebookManager sharedManagerWithAppID:@"123123123123123" andPermissionsArray:permissionsArray];
    /************************************************************/
    
    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

-(IBAction)connectToFacebook:(id)sender
{
    NSLog(@"Button Pushed");
    /************************************************************/
    // We always call renew, if the user is connected there is no reason to authrize again.
    [[MFFacebookManager sharedManager] renewFacebookConnect];
    /************************************************************/
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
