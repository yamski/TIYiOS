//
//  DDDcustomerService.m
//  delegate protocol
//
//  Created by JOHN YAM on 4/14/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "DDDcustomerService.h"

@implementation DDDcustomerService

- (void)saveCustomer:(NSString *)name
{
    //fires the event/delegation. going to check who ever conforms to this delegate, send the didSaveCustomer to it
    [self.delegate didSaveCustomer:name];
}


@end
