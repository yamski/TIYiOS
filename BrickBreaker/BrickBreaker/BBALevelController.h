//
//  BBALevelController.h
//  BrickBreaker
//
//  Created by JOHN YAM on 4/17/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBALevelDelegate;


@interface BBALevelController : UIViewController

@property (nonatomic, assign) id<BBALevelDelegate> delegate;

// we put this in the .h file so that we can use it in other classes. In this case, root VC
-(void)resetLevel;

@end


@protocol BBALevelDelegate <NSObject>

@optional

-(void)addPoints:(int)points;
-(void)gameDone;
-(void)lifeCounter:(int)lives;

@end



