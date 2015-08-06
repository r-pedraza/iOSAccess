//
//  RPLConstants.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLConstants.h"

@implementation RPLConstants

#define BASIC_URL @"https://api.forecast.io/forecast/519733f6b33fa79b4d6365e9381b6f0b/"
#define LATITUDE_METERS  10000
#define LONGITUDE_METERS  10000
#define LATITUDE_METERS_FOR_ZOOM 2500
#define LONGITUDE_METERS_FOR_ZOOM 2500
#define NIB_NAME @"RPLDetailWeatherTableViewCell"
#define CELL_IDENTYFY @"Cell"

#pragma mark - Keys for DictionaryInWeatherModel
#define KEY_TEMPERATURE @"temperature"
#define KEY_TIME @"time"
#define KEY_SUMMARY @"summary"
#define KEY_HOURLY @"hourly"
#define KEY_DATA @"data"




@end
