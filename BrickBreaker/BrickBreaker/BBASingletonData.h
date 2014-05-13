//
//  BBASingletonData.h
//  BrickBreaker
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBASingletonData : NSObject

+ (BBASingletonData *)createSingleton;

@property (nonatomic) NSMutableDictionary * userData;

-(NSNumber *)highscore;

-(NSNumber *)pastScore;

-(NSNumber *)playerLives;

-(NSNumber *)currentScore;






@end
