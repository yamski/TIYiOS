//
//  NAVTableView.m
//  navExercise
//
//  Created by JOHN YAM on 5/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "NAVTableView.h"

@implementation NAVTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.separatorInset = UIEdgeInsetsZero;
        self.separatorColor = [UIColor blueColor];
       
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
