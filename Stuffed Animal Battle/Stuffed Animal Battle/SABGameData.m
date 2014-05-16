//
//  SABGameData.m
//  Stuffed Animal Battle
//
//  Created by JOHN YAM on 5/16/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "SABGameData.h"

@implementation SABGameData

+(SABGameData *)mainData
{
    static dispatch_once_t create;
    static SABGameData * singleton = nil;
    
    dispatch_once( &create, ^{
        singleton = [[SABGameData alloc]init];
    });
    
    return singleton;
}

@end


