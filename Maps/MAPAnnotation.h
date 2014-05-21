//
//  MAPAnnotation.h
//  Maps
//
//  Created by JOHN YAM on 5/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface MAPAnnotation : NSObject <MKAnnotation>

@property (nonatomic,readonly, copy) NSString * title;
@property (nonatomic, readonly, copy) NSString * subtitle;


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//ready only. cant do self.coordinate = something. use this method below to bypass ready only
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

-(void)setTitle:(NSString *)title;
-(void)setSubtitle:(NSString *)subtitle;

@end
