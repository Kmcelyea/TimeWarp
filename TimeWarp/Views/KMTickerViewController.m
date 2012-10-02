//
//  KMTickerViewController.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMTickerViewController.h"
#import "KMClock.h"

@interface KMTickerViewController ()

@end

@implementation KMTickerViewController

-(void)awakeFromNib{
    

    [self loadtickerbar];
    
}




-(void)loadtickerbar{

     double progress = [[KMClock instance]currentprogresshour];
    [_ticker setDoubleValue:progress];
    _tickerTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                   target:self
                                                 selector:@selector(updateProgress:)
                                                 userInfo:nil
                                                  repeats:YES];
    
    
}




-(void)updateProgress:(NSTimer *)timer {
    

    double progress = [[KMClock instance]currentprogresshour];
    [_ticker setDoubleValue:progress];
    
}


@end
