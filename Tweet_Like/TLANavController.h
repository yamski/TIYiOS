//
//  TLANavController.h
//  Tweet_Like
//
//  Created by JOHN YAM on 4/23/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>

//I am going to import in the .m,
//later, you will know what this class is when you implement the method
@class TLATableVC;


@interface TLANavController : UINavigationController

- (void)addTableViewController:(TLATableVC *)viewController;

@end
