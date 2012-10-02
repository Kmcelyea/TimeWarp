//
//  KMLicenseView.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <Cocoa/Cocoa.h>

@interface KMLicenseView : NSObject


@property(assign)IBOutlet NSWindow * window;
@property(assign)IBOutlet WebView * webview;
-(IBAction)showLicense:(id)sender;


@end
