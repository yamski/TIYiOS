//
//  DNASingleton.h
//  DataNowApp
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNASingleton : NSObject

+ (DNASingleton *)sharedSingleton;

@property (nonatomic) NSDictionary * sectionInfo;

- (NSArray *)allSections;

- (NSArray *)allRowsForSections:(NSString *)sectionName;

@end
