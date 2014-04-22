//
//  TIAViewController.h
//  Tweeted
//
//  Created by JOHN YAM on 4/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIAViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tweetLabel;
@property (nonatomic) NSDictionary * tweet;

@end
