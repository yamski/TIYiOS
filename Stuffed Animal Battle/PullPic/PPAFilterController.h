//
//  PPAFilterController.h
//  PullPic
//
//  Created by JOHN YAM on 5/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PPAFilterControllerDelegate;

@interface PPAFilterController : UIViewController


@property (nonatomic, assign) id<PPAFilterControllerDelegate> delegate;

@property (nonatomic) UIImage * imageToFilter;

@end


@protocol PPAFilterControllerDelegate <NSObject>

- (void)updateCurrentImageWithFilteredImage: (UIImage *)image;

@end
