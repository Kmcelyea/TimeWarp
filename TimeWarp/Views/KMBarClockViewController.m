//
//  KMBarClockViewController.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMBarClockViewController.h"
#import "KMClock.h"

@interface KMBarClockViewController ()

@end

@implementation KMBarClockViewController

-(void)awakeFromNib{
    
    
    [self loadclockbars];
    
}


-(void)loadclockbars {
    
    double progress = [[KMClock instance]currentprogresshour];
    double progressmin = [[KMClock instance]currentprogressmin];
    double progressSec = [[KMClock instance]currentprogressSec];
    
    [_hourindicator setDoubleValue:progress];
    [_minindicator setDoubleValue:progressmin];
    [_secindicator setDoubleValue:progressSec];
    
    [_hour setStringValue:[NSString stringWithFormat:@"%.f",progress]];
    [_min setStringValue:[NSString stringWithFormat:@"%.f",progressmin]];
    [_sec setStringValue:[NSString stringWithFormat:@"%.f",progressSec]];


     [_hour setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_min setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_sec setTextColor:[[KMConfiguration instance]TimeColor2]];
    _holdHour = progress;
    _holdMin = progressmin;
    _holdSec = progressSec;
    
    _tickerTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                  selector:@selector(updateProgress:)
                                                  userInfo:nil
                                                   repeats:YES];
}




-(void)updateProgress:(NSTimer *)timer {
    
    if ([_window isVisible]) {
    [_hour setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_min setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_sec setTextColor:[[KMConfiguration instance]TimeColor2]];
    
    double progress = [[KMClock instance]currentprogresshour];
    if (_holdHour != progress) {
        [_hour setStringValue:[NSString stringWithFormat:@"%.f",progress]];
        [_hourindicator setDoubleValue:progress];
    }
    double progressmin = [[KMClock instance]currentprogressmin];
    if (_holdMin != progressmin) {
        [_min setStringValue:[NSString stringWithFormat:@"%.f",progressmin]];
          [_minindicator setDoubleValue:progressmin];
    }
    double progressSec = [[KMClock instance]currentprogressSec];
    if (_holdSec != progressSec) {
        [_sec setStringValue:[NSString stringWithFormat:@"%.f",progressSec]];
          [_secindicator setDoubleValue:progressSec];
    }
 }
    else {
        
        
    }
}
@end
