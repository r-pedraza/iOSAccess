//
//  RPLInteractorIO.h
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RPLInteractorInput <NSObject>

-(void) addNewWeathers:(NSArray*)weathers;//Queremos crear nuevos weathers con cada llamada al Api.
-(void) restApiConexionWithLatitude:(double)latitude longitude:(double)longitude url:(NSString*)url;

@end

@protocol RPLInteractorOutput <NSObject>

-(void)updateWeather:(NSArray*)weathers;

@end
