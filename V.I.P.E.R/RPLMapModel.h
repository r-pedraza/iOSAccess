//
//  RPLMapModel.h
//  AutentiaAccess
//
//  Created by Raúl Pedraza on 2/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RPLMapModel : NSObject
@property (assign,nonatomic) CLLocationCoordinate2D locationCordinate2D;
@property (strong,nonatomic) MKMapView *mapView;

-(id)initWithLatitude:(CLLocationDegrees) latitude longitude:(CLLocationDegrees) longitude;
-(void)mapObtainPosition:(MKCoordinateRegion)actual region:(MKCoordinateRegion)newRegion map:(MKMapView*)map;
@end
