//
//  JLYViewController.m
//  W1D1 App
//
//  Created by JOHN YAM on 3/31/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "JLYViewController.h"

@interface JLYViewController ()

@end

@implementation JLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonOne:(id)sender {
    self.labelOne.text = @"Change this label";
}
- (IBAction)pushButtonTwo:(id)sender {
    self.labelTwo.text = self.textField.text;
}

- (IBAction)pushButtonThree:(id)sender {
    self.labelThree.backgroundColor = [UIColor blueColor];
}
- (IBAction)pushButtonFour:(id)sender {
    self.view.backgroundColor = [UIColor lightGrayColor];
}
@end
