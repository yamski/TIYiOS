//
//  NAVsingletonData.h
//  navExercise
//
//  Created by JOHN YAM on 5/18/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAVsingletonData : NSObject

+ (NAVsingletonData *)mainData;

@property (nonatomic) NSMutableArray * colors;
@property (nonatomic) NSMutableArray * numbers;

@end
