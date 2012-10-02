//
//  KMAppDelegate.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KMCountView.h"

@interface KMAppDelegate : NSObject <NSApplicationDelegate>
{
    
    
    
}

@property (nonatomic)NSColor * localColor;


@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *slidewindow;
@property (assign) IBOutlet NSWindow *clockwindow;
@property (assign) IBOutlet KMCountView *slideview;
@property (assign) IBOutlet NSWindow *tickerwindow;
@property (assign) IBOutlet NSWindow *barclockwindow;

@property (nonatomic, weak)IBOutlet NSSegmentedControl *showsegment;



-(IBAction)showSlide:(id)sender;

-(NSColor *)localColor;




@end
