//
//  KMClockViewController.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMClockViewController.h"
#import "KMClock.h"

@interface KMClockViewController ()

@end

@implementation KMClockViewController


-(void)awakeFromNib{

    
    [self loadClock];
    [self loadprogressbar];

}




-(void)loadClock{
    
   _clockLabel = [[KMClock instance]getTime];
    [_clockField setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_clockField setStringValue:_clockLabel];
    [_clockField setHidden:NO];
    
    _clockAMPMLabel = [[KMClock instance]getLocalTime];
    [_clockAMPMField setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_clockAMPMField setStringValue:_clockAMPMLabel];
    [_clockAMPMField setHidden:NO];
    
    [_percent setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_staticpercent setTextColor:[[KMConfiguration instance]TimeColor2]];
    [_staticprogress setTextColor:[[KMConfiguration instance]TimeColor2]];
    
    _clockTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(updateTimes:)
                                                   userInfo:nil
                                                    repeats:YES];

    
}


-(void)loadprogressbar {
    
    double progress = [[KMClock instance]currentprogresshour];
    double percentdone = (progress/24);
    NSLog(@"percentdone = %.2f",percentdone);
    _progresspercent = [NSString stringWithFormat:@"%.2f",percentdone];
    NSString * stripdouble = [_progresspercent stringByReplacingOccurrencesOfString:@"0." withString:@""];
    NSString * stripfulldot = [stripdouble stringByReplacingOccurrencesOfString:@"." withString:@""];
    [_percent setStringValue:[NSString stringWithFormat:@"%@",stripfulldot]];
    [_ticker setDoubleValue:progress];
}

-(void)updateTimes:(NSTimer *)timer {
    
    if ([_window isVisible]) {
        
    
    
    [_staticpercent setTextColor:[[KMConfiguration instance]TimeColor2]];
    [_staticprogress setTextColor:[[KMConfiguration instance]TimeColor2]];
    [_percent setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_clockAMPMField setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_clockField setTextColor:[[KMConfiguration instance]localTimeColor]];
    //Update the main clock label every second.
    _clockLabel = [[KMClock instance]getTime];
    [_clockField setStringValue:_clockLabel];
    
   
    //Get the value for AMPM Label for comparison.
    _clockAMPMLabel = [[KMClock instance]getLocalTime];
    
    if (![_clockAMPMLabel isEqualToString:[_clockAMPMField stringValue]]) {
        [_clockAMPMField setStringValue:_clockAMPMLabel];
        
        
        //Progress bar update if clockAMPM string is not equal to the displayed field value
        //The idea is if the value is different than what is on the screen update it and set it to the value it got that was different. This if should also call this set of progress to reflect the change in hour.
        double progress = [[KMClock instance]currentprogresshour];
        double percentdone = (progress/24);
                _progresspercent = [NSString stringWithFormat:@"%.2f",percentdone];
        NSString * stripdouble = [_progresspercent stringByReplacingOccurrencesOfString:@"0." withString:@""];
        NSString * stripfulldot = [stripdouble stringByReplacingOccurrencesOfString:@"." withString:@""];
        [_percent setStringValue:[NSString stringWithFormat:@"%@",stripfulldot]];
        [_ticker setDoubleValue:progress];
    }
    }
    else {
      
        
    }

}


@end
