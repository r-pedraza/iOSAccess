//
//  AppDelegate.m
//  V.I.P.E.R
//
//  Created by Raúl Pedraza on 5/8/15.
//  Copyright (c) 2015 Raúl Pedraza. All rights reserved.
//

#import "AppDelegate.h"
#import "RPLInteractor.h"
#import "RPLPresenter.h"
#import "RPLViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createScreen];
    return YES;
}

-(void)createScreen{

    RPLViewController *view = [[RPLViewController alloc]init];
    RPLPresenter *presenter = [[RPLPresenter alloc]init];
    RPLInteractor *interactor = [[RPLInteractor alloc]init];
    
    view.presenter = presenter;
    presenter.view = view;
    
    presenter.interactor = interactor;
    interactor.output = presenter;
    
    self.window.rootViewController = view;

}
@end
