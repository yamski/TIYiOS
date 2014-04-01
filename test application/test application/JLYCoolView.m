//
//  JLYCoolView.m
//  test application
//
//  Created by JOHN YAM on 4/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "JLYCoolView.h"

@implementation JLYCoolView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
+ (NSNumber *)randomNumber
{
    NSNumber *num = [NSNumber numberWithInt:0];
    num = @5;
    
    return num;
}

- (NSString *)whatIsAString{
    
}

@end
