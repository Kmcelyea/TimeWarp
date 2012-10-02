//
//  KMClockMenu.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMClockMenu : NSObject

@property(nonatomic)IBOutlet NSWindow *clockwindow;
@property(nonatomic)IBOutlet NSWindow *barclockwindow;

-(IBAction)showClock:(id)sender;
-(IBAction)hideClock:(id)sender;

-(IBAction)showbarClock:(id)sender;
-(IBAction)hidebarClock:(id)sender;

@end
