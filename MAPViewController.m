//
//  MAPViewController.m
//  Maps
//
//  Created by JOHN YAM on 5/21/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "MAPViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MAPAnnotation.h"

@interface MAPViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MAPViewController
{
    CLLocationManager * lManager;
    
    MKMapView * myMapView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        lManager = [[CLLocationManager alloc] init];
        
        // view controller, CLLocation manager - you are my delegate. I with tell you stuff!
        lManager.delegate = self;
        
        //myMapView.delegate = self;
        
        lManager.distanceFilter = 1000;
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        [lManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    // only sends latest location
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (CLLocation * location in locations) {
        
        MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
        
        [myMapView addAnnotation:annotation];
        
       // [mapView setCenterCoordinate:[location coordinate] animated:YES];
        
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(.05, .05));
        
        [myMapView setRegion:region animated:YES];
        
        NSLog(@"%@",location);
        
        
//    annotation.title = @"Title";
//    annotation.subtitle = @"this is the subtitle";
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
        
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
           
            NSLog(@"%@",placemarks);
            
            for (CLPlacemark * placemark in placemarks)
            {
                NSLog(@"%@",placemark);
                
                NSLog(@"%@",placemark.country);
                
                NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"], placemark.addressDictionary[@"State"]];
                
                [annotation setTitle:cityState];
                [annotation setSubtitle:placemark.country];
                
            }
        }];
        
    }
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (annotationView == nil)
    {
       annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
   
    } else {
        
        //updating annotationView to the new location when the view is reused
        annotationView.annotation = annotation;
    }
    
    
    annotationView.draggable = YES;
    
    //displays the label above the pin
    annotationView.canShowCallout = YES;
    
    return annotationView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    myMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    myMapView.delegate = self;

    [self.view addSubview:myMapView];
    
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"new state : %d and old state %d", (int)newState, (int)oldState);
    
    switch ((int)newState)
    {
        case 0: // not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
            
            CLLocation * location = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                
                //NSLog(@"%@",placemarks);
                
                for (CLPlacemark * placemark in placemarks)
                {
                    
                    NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"], placemark.addressDictionary[@"State"]];
                                            
                    
                    [(MAPAnnotation *)view.annotation setTitle:cityState];
                    [(MAPAnnotation *)view.annotation setSubtitle:placemark.country];
                    
                    NSLog(@"%@",placemark);
                    
                    NSLog(@"%@",placemark.addressDictionary);
                }
            }];
        }
            
            break;
            
        case 1: // start dragging
            
            break;
            
        case 2: // dragging
            
            break;
            
        case 4: // end dragging
            
            break;
            
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
