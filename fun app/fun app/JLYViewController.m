//
//  JLYViewController.m
//  fun app
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
	
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
      self.myLabel.text = @"John";
}
@end
