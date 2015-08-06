//
//  RPLEntity.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLEntity.h"
#import "RPLConstants.h"

@implementation RPLEntity


+(id)weatherWithDictionary:(NSDictionary *)dictionary{
    
    
    return [[self alloc]initWithDictionary:dictionary];
    
}


#pragma mark - init


-(id)initWithTemperature:(NSString *)temperature
                    hour:(NSString *)hour
                 summary:(NSString *)summary{
    
    if (self = [super init]) {
        
        _temperature = temperature;
        _hour = hour;
        _summary = summary;
        
    }
    
    
    return self;
}
//Inicializamos a partir de NSDictionary
-(id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        //Se hace para evitar problemas con setter personalizados.
        _temperature =[dic objectForKey:@"temperature"];
        _hour = [dic objectForKey:@"time"];
        _summary = [dic objectForKey:@"summary"];
    }
    
    return [self initWithTemperature:[dic objectForKey:@"temperature"]
                                hour:[dic objectForKey:@"time"]
                             summary:[dic objectForKey:@"summary"]];
}



#pragma mark - utils

-(NSString*)parseDate:(NSString*)date{
    
    NSString *sval = date;
    double dval = [sval doubleValue];
    NSDate *newDate =[NSDate dateWithTimeIntervalSince1970:dval];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour fromDate:newDate];
    NSInteger hour = [components hour];
    
    
    return [NSString stringWithFormat:@"%ld",(long)hour];
}

@end
