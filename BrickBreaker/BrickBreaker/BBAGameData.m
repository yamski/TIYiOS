//
//  BBAGameData.m
//  BrickBreaker
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "BBAGameData.h"

@implementation BBAGameData

+ (BBAGameData *) mainData
{
    static dispatch_once_t create;
    static BBAGameData * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[BBAGameData alloc] init];
    });
    
    return singleton;
}

-(void)setCurrentScore:(NSInteger)currentScore
{
    _currentScore = currentScore;
    
    if(currentScore > _topScore) _topScore = currentScore;
    
    NSLog(@"curent score %d _topscore %d",_currentScore, _topScore);
}

- (NSArray *)gamesScores
{
    return @[];
}

@end
