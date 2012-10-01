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

    [_clockwindow makeKeyAndOrderFront:self];
    
}

-(IBAction)hideClock:(id)sender {
    [_clockwindow orderOut:self];
    
}

@end
