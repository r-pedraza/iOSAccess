//
//  RPLMapModel.m
//  AutentiaAccess
//
//  Created by Raúl Pedraza on 2/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLMapModel.h"

@implementation RPLMapModel


-(id)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees) longitude {

    if (self = [super init] ) {

        _locationCordinate2D = CLLocationCoordinate2DMake(latitude, longitude);
    
    }
    return self;
}



-(void)mapObtainPosition:(MKCoordinateRegion)actual region:(MKCoordinateRegion)newRegion map:(MKMapView*)map{

    //Realizamos el cambio en dos partes indicando los segundos
    //Esta seria la primera parte.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [map setRegion:newRegion animated:YES];
        
    });
    
    //La segunda parte una vez que hayamos terminado.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [map setRegion:actual animated:YES];
        
    });
}


@end
