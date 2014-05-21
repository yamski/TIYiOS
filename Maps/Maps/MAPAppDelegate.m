//
//  MAPAppDelegate.m
//  Maps
//
//  Created by JOHN YAM on 5/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "MAPAppDelegate.h"
#import "MAPViewController.h"

@implementation MAPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[MAPViewController alloc]init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
