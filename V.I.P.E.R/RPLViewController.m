//
//  RPLViewController.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "RPLViewController.h"
#import "RPLDetailWeatherTableViewCell.h"
#import "RPLConstants.h"
#import "V_I_P_E_R-Swift.h"
#import "RPLEntity.h"

@interface RPLViewController ()<UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate>

@end

@implementation RPLViewController


#pragma mark - Cycle Life

-(void)viewWillAppear:(BOOL)animated{
      NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/519733f6b33fa79b4d6365e9381b6f0b/%f,%f",0.0,0.0];
    [self.presenter restApiConexionWithLatitude:0.0 longitude:0.0 url:url];

    [super viewWillAppear:YES];
    [self initMap];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Si tienes alguna celda damela
    static NSString *MyIdentifier = @"Cell";
    
    RPLDetailWeatherTableViewCell *cell = (RPLDetailWeatherTableViewCell*)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    //Si no tiene ninguna creala
    if (cell == nil) {
        //Cargamos nuestro XIB
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"RPLDetailWeatherTableViewCell"
                                                    owner:self options:nil];
        cell = (RPLDetailWeatherTableViewCell*)[nib objectAtIndex:0];
        
    }

    NSDictionary *modelDic = self.array[indexPath.row];
    cell.temperatureLabel.text = modelDic[@"temperature"];
    cell.hourLabel.text = modelDic[@"time"];
    cell.summaryLabel.text = modelDic[@"summary"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}


#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    //Obtener coordenadas
    CLLocationCoordinate2D myLocation = [userLocation coordinate];
    
    //Zoom Region
    MKCoordinateRegion zoomregion = MKCoordinateRegionMakeWithDistance(myLocation, 2500, 2500);
    
    //Mostrar localizacion en el mapa
    [self.mapView setRegion:zoomregion
                   animated:YES];
    
}

#pragma mark - utils


-(void)initMap{
    
    self.mapView.delegate = self; //Nosotros seremos delegados del Controlador
    //Gesto, llamamos como selector al metodo con el nombre que aparece.
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handleLongPress:)];
    
    //Presion larga instantanea
    lpgr.minimumPressDuration = 0;
    //Añadimos gesto al mapa
    [self.mapView addGestureRecognizer:lpgr];
}

- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D touchCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    NSLog(@"%f, %f", touchCoordinate.latitude, touchCoordinate.longitude);
    
    //Obtengo la posicion donde pulso
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(touchCoordinate, 2500, 2500);
    
    double longitude = touchCoordinate.longitude;
    double latitude = touchCoordinate.latitude;
    [self.mapView setRegion:region animated:YES];
    
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/519733f6b33fa79b4d6365e9381b6f0b/%f,%f",latitude,longitude];
    
    [self.presenter restApiConexionWithLatitude:latitude longitude:longitude url:url];
    
}


-(void)setListWhitObjectWeather:(NSArray *)weathers{
    
    self.array = weathers;
    [self.tableView reloadData];
    
}







@end
