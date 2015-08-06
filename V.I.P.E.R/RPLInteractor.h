//
//  RPLInteractor.h
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPLInteractorIO.h"
#import "RPLPresenter.h"

@interface RPLInteractor : NSObject <RPLInteractorInput>

@property (weak,nonatomic) id<RPLInteractorOutput> output;
@property (strong,nonatomic) NSArray *weathers;
@property (strong,nonatomic) NSDictionary *hourly;

@end
