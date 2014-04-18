//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by JOHN YAM on 4/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "BBAViewController.h"

//importing to have it appear. ViewController is set as rootview controller
#import "BBALevelController.h"

@interface BBAViewController ()

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton *startButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
        
        //add the level controller's view to the rootview controller
        [self.view addSubview:level.view];
        
        startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2 - 100), (SCREEN_HEIGHT /2) - 100, 200, 200)];
        startButton.backgroundColor = [UIColor lightGrayColor];
        startButton.layer.cornerRadius = 100;
        [self.view addSubview:startButton];
        
        
        [startButton setTitle:@"START" forState:UIControlStateNormal];
        startButton.titleLabel.textColor = [UIColor whiteColor];
        [startButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-light" size:45.0]];
        
        
        [startButton addTarget:self action:@selector(goToLevel)
              forControlEvents:UIControlEventTouchUpInside];
    
        
    }
    return self;
}

- (void) goToLevel
{
    [startButton removeFromSuperview];
    [level resetLevel];
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

- (BOOL)prefersStatusBarHidden {return YES;}
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
