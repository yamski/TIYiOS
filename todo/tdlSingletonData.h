//
//  tdlSingletonData.h
//  todo
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tdlSingletonData : NSObject

+ (tdlSingletonData *)sharedCollection;

-(void)addListItems:(NSDictionary *)listItems;

-(NSArray *)allListItems;

-(void)removeListItem:(NSDictionary *)listItem;

-(void)removeListItemAtIndex:(NSInteger)index;

@end
