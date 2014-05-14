//
//  World.h
//  MyFirstData
//
//  Created by JOHN YAM on 5/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface World : NSManagedObject

@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * difficulty;

@end
