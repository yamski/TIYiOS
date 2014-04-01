//
//  CARwheel.m
//  Car
//
//  Created by JOHN YAM on 4/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "CARwheel.h"

@implementation CARwheel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blueColor];
        self.layer.cornerRadius = 20;
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

@end
