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

//says VController will be delegate of LevelDelegate
@interface BBAViewController () <BBALevelDelegate>

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton *startButton;
    UILabel * scoreLabel;
    UILabel * livesLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor colorWithRed:0.961f green:0.969f blue:0.149f alpha:1.0f];
        
    }
    return self;
}

-(void)scoreCard{
    
scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100), 0, 100, 20)];
scoreLabel.backgroundColor = [UIColor clearColor];
scoreLabel.textColor = [UIColor redColor];
[scoreLabel setFont:[UIFont systemFontOfSize:12]];
scoreLabel.textAlignment = NSTextAlignmentCenter;
scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
[self.view addSubview:scoreLabel];
    
    
livesLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, 70, 20)];
livesLabel.backgroundColor = [UIColor clearColor];
livesLabel.textColor = [UIColor redColor];
[livesLabel setFont:[UIFont systemFontOfSize:12]];
livesLabel.text = [NSString stringWithFormat:@"Lives: 3"];
livesLabel.textAlignment = NSTextAlignmentCenter;

[self.view addSubview:livesLabel];
    
}


- (void)startGame
{
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    level.delegate = self;
    
    level.view.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20);
    
    [self.view addSubview:level.view];
    
    [startButton removeFromSuperview];
    [level resetLevel];
    [self scoreCard];
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    
    startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2 - 100), (SCREEN_HEIGHT /2) - 100, 200, 200)];
    startButton.backgroundColor = [UIColor lightGrayColor];
    startButton.layer.cornerRadius = 100;
    [self.view addSubview:startButton];
    
    
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    startButton.titleLabel.textColor = [UIColor whiteColor];
    [startButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-light" size:45.0]];
    
    
    [startButton addTarget:self action:@selector(startGame)
          forControlEvents:UIControlEventTouchUpInside];

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

//these bitches are delegates. they declared in the levelcontroller, but were using them in the view contr
-(void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];
}

-(void)addPoints:(int)points
{
    level.delegate = self;
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i",points];
}

-(void)lifeCounter:(int)lives
{
    level.delegate = self;
    livesLabel.text = [NSString stringWithFormat:@"Score: %i",lives];
    
}
@end
