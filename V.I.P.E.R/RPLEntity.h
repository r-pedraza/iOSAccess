//
//  RPLEntity.h
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RPLEntity : NSObject

@property (copy,nonatomic) NSString *temperature;
@property (copy,nonatomic) NSString *hour;
@property (copy,nonatomic) NSString *summary;

+(id)weatherWithDictionary:(NSDictionary *)dictionary;
-(id)initWithDictionary:(NSDictionary *)dic;
-(id)initWithTemperature:(NSString *)temperature
                    hour:(NSString *)hour
                 summary:(NSString *)summary;

@end
