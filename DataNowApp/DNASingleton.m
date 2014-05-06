//
//  DNASingleton.m
//  DataNowApp
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DNASingleton.h"

@implementation DNASingleton

+ (DNASingleton *)sharedSingleton
{
    static dispatch_once_t singletonBlock;
    static DNASingleton * singleton = nil;
    
    //dispatches only once, and when its created, the object wont go away
    dispatch_once(&singletonBlock, ^{
        singleton = [[DNASingleton alloc] init];
    });
    
    return singleton;
}

//-(NSDictionary *)sectionInfo
//{
//    return @{
//             @"section1": @[@"row1", @"row2"],
//             @"section2": @[@"row1", @"row2", @"row3"]
//             };
//}


-(NSArray *)allSections
{
    return [self.sectionInfo allKeys];
}

- (NSArray *)allRowsForSections:(NSString *)sectionName
{
    return self.sectionInfo[sectionName];
}

@end
