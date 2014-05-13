//
//  tdlSingletonData.m
//  todo
//
//  Created by JOHN YAM on 5/6/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlSingletonData.h"

@interface tdlSingletonData ()

@property (nonatomic) NSMutableArray * listItems;

@end


@implementation tdlSingletonData


+(tdlSingletonData *)sharedCollection
{
    static dispatch_once_t create;
    static tdlSingletonData * singleton = nil;

    dispatch_once(&create, ^{
        singleton = [[tdlSingletonData alloc] init];
    });
    
    return singleton;
}

-(id)init
{
    self = [super init];
    if(self)
    {
        [self loadListItems];
    }
    return self;
}

- (NSMutableArray *)listItems
{
    //changing the getter method so that it never equals nil
    //if something needs to access the array will exist and not be nil
    
    if(_listItems == nil)
    {
        _listItems = [@[] mutableCopy];
    }
    
    NSLog(@"These are the listItems:%@", _listItems);
    
    return _listItems;
}

- (void)addListItems:(NSDictionary *)listItems
{
    [self.listItems addObject:listItems];
    //self.listItems calls the getter method - (NSMutableArray *)listItems
    
    [self saveData];
}

-(NSArray *)allListItems
{
    //copy is an immutable array
    return [self.listItems copy];
    
    //code above is same as below
    //return [NSArray arrayWithArray:self.listItems];
}

-(void)removeListItem:(NSDictionary *)listItem
{
    [self.listItems removeObjectIdenticalTo:listItem];
    
    [self saveData];
}

-(void)removeListItemAtIndex:(NSInteger)index
{
    [self.listItems removeObjectAtIndex:index];
    
    [self saveData];
}

- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.listItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}

- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"list.data"];
}

- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        self.listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}


@end
