//
//  MAPAnnotation.m
//  Maps
//
//  Created by JOHN YAM on 5/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "MAPAnnotation.h"

@implementation MAPAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        
        _coordinate = coordinate;
        
    }
    return self;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    _coordinate = newCoordinate;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
}

-(void)setSubtitle:(NSString *)subtitle
{
    _subtitle = subtitle;
}

@end
