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

-(IBAction)showClock:(id)sender;
-(IBAction)hideClock:(id)sender;

@end
