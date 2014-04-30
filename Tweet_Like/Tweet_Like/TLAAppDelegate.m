//
//  TLAAppDelegate.m
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TLAAppDelegate.h"
#import "TLATableVC.h"
#import "TLANavController.h"


@implementation TLAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //self.window.rootViewController = [[TLATableVC alloc]initWithStyle:UITableViewStylePlain];
    
    //    self.window.rootViewController = [[TLANavController alloc]initWithRootViewController:[[TLATableVC alloc]initWithStyle:UITableViewStylePlain]];
    
    
    
    TLANavController * nc = [[TLANavController alloc] init];
    
    self.window.rootViewController = nc;
    
    TLATableVC * tvc = [[TLATableVC alloc]initWithStyle:UITableViewStylePlain];
    
    [nc addTableViewController: tvc];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
