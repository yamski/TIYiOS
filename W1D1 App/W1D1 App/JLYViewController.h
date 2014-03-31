//
//  JLYViewController.h
//  W1D1 App
//
//  Created by JOHN YAM on 3/31/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLYViewController : UIViewController

- (IBAction)pushButtonOne:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelOne;

- (IBAction)pushButtonTwo:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *labelTwo;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)pushButtonThree:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *labelThree;

- (IBAction)pushButtonFour:(id)sender;

@end
