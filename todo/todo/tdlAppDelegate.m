//
//  tdlAppDelegate.m
//  todo
//
//  Created by JOHN YAM on 4/2/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlAppDelegate.h"
#import "tdlTableViewController.h"

@implementation tdlAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    tdlTableViewController * tableViewController = [[tdlTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
