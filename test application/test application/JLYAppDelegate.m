//
//  JLYAppDelegate.m
//  test application
//
//  Created by JOHN YAM on 4/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "JLYAppDelegate.h"
#import "JLYRootViewController.h"

@implementation JLYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[JLYRootViewController alloc] init];
   
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
