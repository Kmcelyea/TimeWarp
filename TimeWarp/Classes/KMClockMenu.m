//
//  KMClockMenu.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMClockMenu.h"

@implementation KMClockMenu

-(IBAction)showClock:(id)sender {
    [_clockwindow setIsVisible:YES];
    [_clockwindow makeKeyAndOrderFront:self];
    
}

-(IBAction)hideClock:(id)sender {
    [_clockwindow orderOut:self];
    [_clockwindow setIsVisible:NO];
    
}

-(IBAction)showbarClock:(id)sender {
    [_barclockwindow setIsVisible:YES];
    [_barclockwindow makeKeyAndOrderFront:self];
    
}

-(IBAction)hidebarClock:(id)sender {
    [_barclockwindow orderOut:self];
    [_barclockwindow setIsVisible:NO];
    
}
@end
