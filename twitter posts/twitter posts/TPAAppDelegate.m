//
//  TPAAppDelegate.m
//  twitter posts
//
//  Created by JOHN YAM on 5/20/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TPAAppDelegate.h"
#import "TPAViewController.h"

@implementation TPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[TPAViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
