//
//  KMCreateNewCountDown.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMCreateNewCountDown.h"
#import "KMCountDownView.h"
#import "GlobalHeader.h"

@implementation KMCreateNewCountDown
@synthesize countDownWindow = _countDownWindow;


-(IBAction)CountdownView:(id)sender {
    
    KMCountDownView * newCountView = [[KMCountDownView alloc]initWithNibName:@"KMCountDownView" bundle:nil];
    
    NSSize size = newCountView.view.frame.size;
    int height = size.height;
    int width = size.width;
    
    NSRect frame = NSMakeRect(0, 661,width, height);
    

    

    _countDownWindow = [[NSWindow alloc]initWithContentRect:frame styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];

    [_countDownWindow setContentView:newCountView.view];
    
    [_countDownWindow setBackgroundColor:Transblack];
    [_countDownWindow setOpaque:NO];
    [_countDownWindow setMovableByWindowBackground:YES];

    [_countDownWindow makeKeyAndOrderFront:nil];
    
    
    
    
    
}

@end
