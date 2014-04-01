//
//  JLYCoolView.h
//  test application
//
//  Created by JOHN YAM on 4/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLYCoolView : UIView

@property (nonatomic) NSString *cooltitle;

+ (NSNumber *)randomNumber;
- (NSString *)whatIsAString;

- (void)changeTitle:(NSString *)newTitle;

@end
