//
//  ViewController.m
//  TmapGPS
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "TMapView.h"

#define APP_KEY @"9808e4e1-db20-3f1f-8b3c-77606b3b71a1"
#define TOOLBAR_HIGHT 60

@interface ViewController () <TMapGpsManagerDelegate>

@property (strong, nonatomic) TMapGpsManager *gpsManager;
@property (strong, nonatomic) TMapView *mapView;

@end

@implementation ViewController

#pragma mark GPS Manager's Delegate
- (void)locationChanged:(TMapPoint *)newTmp{
    NSLog(@"Location Changed : %@", newTmp);
    [self.mapView setCenterPoint:newTmp];
    
}

- (void)headingChanged:(double)heading{
    
}
- (IBAction)switchGPS:(id)sender {
    UISwitch *_switch = (UISwitch *)sender;
    
    if(YES == _switch.on){
        [self.gpsManager openGps];
    }
    else{
        [self.gpsManager closeGps];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect rect = CGRectMake(0, TOOLBAR_HIGHT, self.view.frame.size.width, self.view.frame.size.height - TOOLBAR_HIGHT);
    self.mapView = [[TMapView alloc]initWithFrame:rect];
    [self.mapView setSKPMapApiKey:APP_KEY];
    
    self.mapView.zoomLevel =12.0;
    [self.view addSubview:self.mapView];
    
    self.gpsManager = [[TMapGpsManager alloc]init];
    [self.gpsManager setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
