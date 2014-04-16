//
//  DDDAppDelegate.m
//  delegate protocol
//
//  Created by JOHN YAM on 4/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DDDAppDelegate.h"
#import "DDDViewController.h"

@implementation DDDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[DDDViewController alloc] initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
