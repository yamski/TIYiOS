//
//  TIAViewController.m
//  Tweeted
//
//  Created by JOHN YAM on 4/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "TIAViewController.h"

@interface TIAViewController ()

@end

@implementation TIAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.nameLabel.text = self.tweet[@"name"];
    self.tweetLabel.text = self.tweet[@"text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
