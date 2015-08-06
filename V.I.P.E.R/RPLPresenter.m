//
//  RPLPresenter.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLPresenter.h"
#import "V_I_P_E_R-Swift.h"

@implementation RPLPresenter


-(void) restApiConexionWithLatitude:(double)latitude longitude:(double)longitude url:(NSString*)url{

    [self.interactor restApiConexionWithLatitude:latitude longitude:longitude url:url];
}

-(void)addNewWeathers:(NSArray *)weathers{

    [self.interactor addNewWeathers:weathers];
}


#pragma mark - Interactor output
-(void)updateWeather:(NSArray *)weathers{

    [self.view setListWhitObjectWeather:weathers];
}

@end
