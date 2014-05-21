//
//  EMOAppDelegate.m
//  Status
//
//  Created by JOHN YAM on 5/19/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "EMOAppDelegate.h"
#import "EMOcolorsVC.h"



@implementation EMOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
    EMOcolorsVC * colorsVC = [[EMOcolorsVC alloc] init];
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:colorsVC];
    
    [nc setNavigationBarHidden:YES animated:NO];
    
    self.window.rootViewController = nc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
