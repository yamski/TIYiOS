//
//  RVBRootVController.m
//  redBlue
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "RVBRootVController.h"
#import "RVBRedVController.h"
#import "RVBBlueVController.h"
#import "RVBgameData.h"

@interface RVBRootVController () <RVBredScoreDelegate>

@end

@implementation RVBRootVController
{
    RVBBlueVController * blueVC;
    RVBRedVController * redVC;
    
    NSInteger redPoint;
    NSInteger bluePoint;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    blueVC = [[RVBBlueVController alloc]initWithNibName:nil bundle:nil];
    
    [self.view addSubview:blueVC.view];
    
    redVC = [[RVBRedVController alloc] initWithNibName:nil bundle:nil];
    
    redVC.delegate = self;
    
    [self.view addSubview:redVC.view];
    
    
    self.redScoreLabel = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH/2) - 50, 20, 100, 50)];
    
    self.redScoreLabel.backgroundColor = [UIColor redColor];
    
    [blueVC.view addSubview:self.redScoreLabel];
    
    self.redScoreLabel.text = [NSString stringWithFormat:@"Red Score: %d",[RVBgameData mainData].redScore];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
