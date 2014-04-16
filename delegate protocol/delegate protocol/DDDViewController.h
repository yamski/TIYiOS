//
//  DDDViewController.h
//  delegate protocol
//
//  Created by JOHN YAM on 4/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDDcustomerService.h"

@interface DDDViewController : UIViewController<customerServiceDelegate> //view controller will be delegate


- (IBAction)saveButton:(id)sender;

@end
