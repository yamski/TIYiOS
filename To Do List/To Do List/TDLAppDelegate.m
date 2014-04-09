//
//  TDLAppDelegate.m
//  To Do List
//
//  Created by JOHN YAM on 4/8/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TDLAppDelegate.h"
#import "TDLTableViewController.h"

@implementation TDLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    TDLTableViewController *tableViewConrtoller = [[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.window.rootViewController = tableViewConrtoller;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
