//
//  KMLicenseView.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMLicenseView.h"


@implementation KMLicenseView

-(IBAction)showLicense:(id)sender {

    [_window setBackgroundColor:Transblack];
    [_window setFrame:NSMakeRect(0, 661, 300, 110) display:YES];

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"License" ofType:@"html"]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [[_webview mainFrame] loadRequest:req];

    [_window makeKeyAndOrderFront:self];
}


@end
