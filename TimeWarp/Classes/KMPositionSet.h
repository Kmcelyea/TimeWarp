//
//  KMPositionSet.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/27/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMPositionSet : NSObject

@property(assign)IBOutlet NSWindow *window;
@property(assign)IBOutlet NSWindow *windowslide;
@property(assign)IBOutlet NSWindow *windowticker;
@property(assign)IBOutlet NSWindow *windowbarclock;

-(IBAction)SetBottomLeft:(id)sender;
-(IBAction)SetBottomRight:(id)sender;
-(IBAction)SetTopLeft:(id)sender;
-(IBAction)SetTopRight:(id)sender;

@end
