//
//  SABViewController.m
//  Stuffed Animal Battle
//
//  Created by JOHN YAM on 5/15/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SABViewController.h"

#import <SpriteKit/SpriteKit.h>

#import "SABGameScene.h"

@interface SABViewController ()

@end

@implementation SABViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        SKView * skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        
        [skView presentScene:skScene];
        
        
        UIButton * buttonA = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 40, SCREEN_HEIGHT - 60, 40, 40)];
        buttonA.backgroundColor = [UIColor lightGrayColor];
        [buttonA setTitle:@"A" forState:UIControlStateNormal];
        buttonA.layer.cornerRadius = 20;
        
        [buttonA addTarget:skScene action:@selector(buttonAclicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:buttonA];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
