//
//  BBASingletonData.m
//  BrickBreaker
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "BBASingletonData.h"

@implementation BBASingletonData

+(BBASingletonData *)createSingleton
{
    static dispatch_once_t singletonBlock;
    static BBASingletonData * sharedData = nil;
    
    //dispatches only once, and when its created, the object wont go away
    dispatch_once(&singletonBlock, ^{
        sharedData = [[BBASingletonData alloc] init];
    });
    
    return sharedData;
}

-(NSMutableDictionary *)userData
{
    NSMutableDictionary * userData = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                     @"current highscore": @0,
                                                                                     @"past scores": [@[] mutableCopy],
                                                                                     @"lives": @3,
                                                                                     @"current score": @0
                                                                                    }];
     NSLog(@"%@", userData[@"current score"]);
    return userData;
}

-(NSNumber *)highscore
{
    return self.userData[@"current highscore"];
}

-(NSNumber *)pastScore
{
    return self.userData[@"past scores"];
}

-(NSNumber *)playerLives
{
    return self.userData[@"lives"];
}

-(NSNumber *)currentScore
{
    return self.userData[@"current score"];
}
@end


