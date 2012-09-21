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


@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSWindow *slidewindow;
@property (assign) IBOutlet KMCountView *slideview;
@property (nonatomic, weak)IBOutlet NSSegmentedControl *showsegment;



-(IBAction)showSlide:(id)sender;





@end
