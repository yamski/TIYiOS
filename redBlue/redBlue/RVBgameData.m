//
//  RVBgameData.m
//  redBlue
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "RVBgameData.h"

@implementation RVBgameData


+(RVBgameData *)mainData
{
    static dispatch_once_t create;
    static RVBgameData * gamedata = nil;
    
    dispatch_once(&create, ^{
        gamedata = [[RVBgameData alloc]init];
    });
    
    return gamedata;
}


@end


