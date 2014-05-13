//
//  RVBRedVController.h
//  redBlue
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RVBredScoreDelegate;

@interface RVBRedVController : UIViewController



@property (nonatomic, assign) id <RVBredScoreDelegate> delegate;

@end
