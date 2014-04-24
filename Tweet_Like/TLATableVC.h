//
//  TLATableVC.h
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATableVC : UITableViewController

//making our array accessible to the nav controller
@property (nonatomic) NSMutableArray * tweetItems;

@property (nonatomic, getter = isTweetItemsEmpty, readonly) BOOL tweetItemsEmpty;

-(void)loadNewTweet:(NSString*)tweet;

- (void)createNewTweet:(NSString *)tweet;




@end
