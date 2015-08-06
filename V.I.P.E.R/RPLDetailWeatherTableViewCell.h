//
//  RPLDetailWeatherTableViewCell.h
//  AutentiaAccess
//
//  Created by Raúl Pedraza on 4/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPLDetailWeatherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end
