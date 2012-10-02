//
//  KMBarClockViewController.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMBarClockViewController : NSViewController

@property (nonatomic)NSTimer *tickerTimer;
@property(assign)IBOutlet NSWindow * window;
@property(assign)IBOutlet NSLevelIndicator *hourindicator;
@property(assign)IBOutlet NSLevelIndicator *minindicator;
@property(assign)IBOutlet NSLevelIndicator *secindicator;

@property(nonatomic, assign)IBOutlet NSTextField *hour;
@property(nonatomic, assign)IBOutlet NSTextField *min;
@property(nonatomic, assign)IBOutlet NSTextField *sec;

@property(nonatomic, assign)double holdHour;
@property(nonatomic, assign)double holdMin;
@property(nonatomic, assign)double holdSec;

-(void)updateProgress:(NSTimer *)timer;

@end
