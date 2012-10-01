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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib{
    [_progressofDay setStyle:NSProgressIndicatorBarStyle];

    [_progressofDay setControlTint:NSBlueControlTint];
    [_progressofDay setIndeterminate:NO];
    [_progressofDay startAnimation:self];
    
    [self loadClock];

}




-(void)loadClock{
    
   _clockLabel = [[KMClock instance]getTime];
    [_clockField setStringValue:_clockLabel];
    [_clockField setHidden:NO];
    
    _clockAMPMLabel = [[KMClock instance]getLocalTime];
    [_clockAMPMField setStringValue:_clockAMPMLabel];
    [_clockAMPMField setHidden:NO];
    _clockTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                     target:self
                                                   selector:@selector(updateTimes:)
                                                   userInfo:nil
                                                    repeats:YES];

    
}

-(void)updateTimes:(NSTimer *)timer {
    
    _clockLabel = [[KMClock instance]getTime];
    [_clockField setStringValue:_clockLabel];
    
    double progress = 22;
    double percentdone = (progress/24);
    NSLog(@"percentdone = %f",percentdone);
    _progresspercent = [NSString stringWithFormat:@"%f",percentdone];
    [_percent setStringValue:[NSString stringWithFormat:@"%@",_progresspercent]];
    [_progressofDay setDoubleValue:progress];
    
    _clockAMPMLabel = [[KMClock instance]getLocalTime];
    if (![_clockAMPMLabel isEqualToString:[_clockAMPMField stringValue]]) {
        [_clockAMPMField setStringValue:_clockAMPMLabel];
        
        
    }
    

}


@end
