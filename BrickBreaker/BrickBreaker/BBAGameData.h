//
//  BBAGameData.h
//  BrickBreaker
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAGameData : NSObject

+ (BBAGameData *) mainData;

@property (nonatomic, readonly) NSInteger topScore;
@property (nonatomic) NSInteger currentScore;

//not getting the array directly, but we want a copy and alter that to avoid possible crashes
-(NSArray *) gamesScores;

@end
