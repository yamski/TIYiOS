//
//  SCGCircle.h
//  ▢s & ◯s
//
//  Created by JOHN YAM on 4/11/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCGCircleDelegate;

@interface SCGCircle : UIView

@property (nonatomic, assign) id<SCGCircleDelegate>delegate;

@property (nonatomic) CGPoint position; 

-(UIColor *)randomColor;

@end





@protocol SCGCircleDelegate <NSObject>

- (UIColor *)circleTappedWithPosition:(CGPoint)position;

@end
