//
//  RPLInteractor.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLInteractor.h"
#import "RPLEntity.h"
#import "V_I_P_E_R-Swift.h"

@implementation RPLInteractor


#pragma mark - Input
-(void) restApiConexionWithLatitude:(double)latitude longitude:(double)longitude url:(NSString*)url{
    
    //Realizamos la petición.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    RPLRestApi *rest = [[RPLRestApi alloc]init];
    [rest httpGet:request callback:^(NSString * data, NSString * error) {
        if (error != nil) {
            //Si va mal
            NSLog(@"%@",error);
        }else {
            //Si va bien serializamos el JSON
            [self serialitationJSONWithString:data];
            //Añadimos a los objetos a nuestro array con sus respectivos atributos.
            [self addNewWeathers:self.weathers];
            NSLog(@"%@",self.weathers);
            
        }
    }];
    
}

-(void)addNewWeathers:(NSArray *)weathers{

    for (NSDictionary *dic in weathers) {
        
        RPLEntity *model = [RPLEntity weatherWithDictionary:dic];
        [self.weathers arrayByAddingObject:model];
        
    }
    
    [self sendObjects];
}

-(void)sendObjects{

    [self.output updateWeather:self.weathers];
}



#pragma mark - Utils
-(NSArray*)serialitationJSONWithString:(NSString*)string{

    NSData *d = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:d options:0 error:nil];
    self.hourly = [json objectForKey:@"hourly"];
    
    return  self.weathers = [self.hourly objectForKey:@"data"];
}



@end
