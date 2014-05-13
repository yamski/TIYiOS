//
//  RVBgameData.h
//  redBlue
//
//  Created by JOHN YAM on 5/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVBgameData : NSObject

+ (RVBgameData *)mainData;

@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger blueScore;

@end
