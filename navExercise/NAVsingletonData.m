//
//  NAVsingletonData.m
//  navExercise
//
//  Created by JOHN YAM on 5/18/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "NAVsingletonData.h"

@implementation NAVsingletonData

+ (NAVsingletonData *)mainData
{
    static dispatch_once_t create;
    static NAVsingletonData * navData = nil;
    
    dispatch_once(&create, ^{
        navData = [[NAVsingletonData alloc] init];
    });
    
    return navData;
}


-(NSMutableArray *)colors
{
    return [@[@"red", @"blue", @"green", @"yellow"] mutableCopy];
    
}

-(NSMutableArray *)numbers
{
    return [@[@1, @2, @3, @4] mutableCopy];
}

@end
