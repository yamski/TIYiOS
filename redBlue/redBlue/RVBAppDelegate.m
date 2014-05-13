//
//  RVBAppDelegate.m
//  redBlue
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "RVBAppDelegate.h"
#import "RVBRootVController.h"


@implementation RVBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[RVBRootVController alloc] initWithNibName:nil bundle:nil];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
