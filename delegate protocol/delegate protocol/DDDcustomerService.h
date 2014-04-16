//
//  DDDcustomerService.h
//  delegate protocol
//
//  Created by JOHN YAM on 4/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol customerServiceDelegate <NSObject>

@required //any class that conforms to this delegate has to use this method
- (void)didSaveCustomer:(NSString *) name;

@end



@interface DDDcustomerService : UIView
{
    
}

//this is how you make a property for a delegate. Actually holds the delegate. Any object (hence id)  conforms to the delegate
@property (nonatomic, retain) id<customerServiceDelegate> delegate;

- (void)saveCustomer:(NSString *) name;

@end
