//
//  RPLPresenter.h
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPLView.h"
#import "RPLInteractor.h"
#import <MapKit/MapKit.h>

@interface RPLPresenter : NSObject<RPLInteractorOutput>

@property (weak,nonatomic)   id<RPLView>           view;
@property (strong,nonatomic) id<RPLInteractorInput> interactor;
-(void) restApiConexionWithLatitude:(double)latitude longitude:(double)longitude url:(NSString*)url;
-(void)addNewWeathers:(NSArray *)weathers;
@end
