//
//  TVPAppDelegate.m
//  tableViewPractice
//
//  Created by JOHN YAM on 4/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TVPAppDelegate.h"
#import "TVPTableViewController.h"

@implementation TVPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
 
    TVPTableViewController *tableViewController = [[TVPTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    self.window.rootViewController = navController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
    
    
}


@end
