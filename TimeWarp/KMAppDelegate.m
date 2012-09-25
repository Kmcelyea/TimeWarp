//
//  KMAppDelegate.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMAppDelegate.h"
#import "GlobalHeader.h"




#pragma mark -
#pragma mark Implementation
@implementation KMAppDelegate


- (id)init {
    self = [super init];
    if (self) {

    }
    return self;
}

#pragma mark -
#pragma mark Finished Launching
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    [_window setBackgroundColor:Transblack];
    [_window setOpaque:NO];
    [_slidewindow setBackgroundColor:Transblack];
    [_slidewindow setOpaque:NO];
    [_window setLevel:NSNormalWindowLevel - 1];
    [_slidewindow setLevel:NSNormalWindowLevel - 1];
   // [[[_drawer contentView]window]setAlphaValue:0.8];
   // [[[_drawer contentView]window]setBackgroundColor:Transblack];
    
}

#pragma mark -
#pragma mark Action Show Count Down Window
-(IBAction)showSlide:(id)sender {
    
    NSInteger selectedSegment = [sender selectedSegment];
    NSInteger clickedSegmentTag = [[sender cell] tagForSegment:selectedSegment];
   
        switch (clickedSegmentTag)
        {
        case 0:
            [_slideview setHidden:NO];
            [_slidewindow makeKeyAndOrderFront:self];
            break;
         case 1:
            [_slideview setHidden:YES];
            [_slidewindow orderOut:self];
            break;
        
        default:
            break;
        }

}






@end
