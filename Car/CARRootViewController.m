//
//  CARRootViewController.m
//  Car
//
//  Created by JOHN YAM on 4/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "CARRootViewController.h"
//views
#import "CARwheel.h"
#import "CARbumper.h"
#import "CARwindow.h"
//buttons
#import "CARignition.h"
#import "CARGasPedal.h"
#import "CARBrake.h"


@interface CARRootViewController ()

@end

@implementation CARRootViewController

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
    
    CARwheel * wheel1 = [[CARwheel alloc] init];
    wheel1.frame = CGRectMake(20, 40, 40, 40);
    wheel1.pressure = 29;
    [self.view addSubview:wheel1];
    
    CARwheel * wheel2 = [[CARwheel alloc] init];
    wheel2.frame = CGRectMake(80, 40, 40, 40);
    wheel2.pressure = 30;
    [self.view addSubview:wheel2];
    
    CARwheel * wheel3 = [[CARwheel alloc] init];
    wheel3.frame = CGRectMake(140, 40, 40, 40);
    wheel3.pressure = 29;
    [self.view addSubview:wheel3];
    
    CARwheel * wheel4 = [[CARwheel alloc] init];
    wheel4.frame = CGRectMake(200, 40, 40, 40);
    wheel4.pressure = 32;
    [self.view addSubview:wheel4];
    
    CARGasPedal * gasPedal = [[CARGasPedal alloc] init];
    gasPedal.frame = CGRectMake(220, 360, 80, 100);
    
    [gasPedal setTitle:@"Start" forState:UIControlStateNormal];
    
    [gasPedal addTarget:self action:@selector(pressGasPedal)
       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gasPedal];
    
    CARwindow * myWindsheild = [[CARwindow alloc] init];
    myWindsheild.frame =CGRectMake(20, 160, 320, 200);
    myWindsheild.backgroundColor = [UIColor blackColor];
    myWindsheild.alpha = .05;
    [self.view addSubview:myWindsheild];
    
    
                             
    

}

-(void) pressGasPedal
{
    NSLog(@"press gas");
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
