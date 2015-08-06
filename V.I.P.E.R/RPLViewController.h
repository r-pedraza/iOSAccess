//
//  RPLViewController.h
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RPLView.h"
#import "RPLPresenter.h"
@interface RPLViewController : UIViewController<RPLView>
@property (strong,nonatomic) NSArray *array;
@property (strong,nonatomic) RPLPresenter *presenter;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
