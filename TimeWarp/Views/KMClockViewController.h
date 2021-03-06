//
//  KMClockViewController.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMClockViewController : NSViewController

@property (nonatomic)NSTimer *clockTimer;
@property (nonatomic, assign)NSString *clockLabel;
@property (nonatomic, assign)NSString *clockAMPMLabel;
@property (nonatomic, assign)IBOutlet NSTextField *clockField;
@property (nonatomic, assign)IBOutlet NSTextField *clockAMPMField;

@property(nonatomic, assign)IBOutlet NSLevelIndicator *ticker;
//@property (nonatomic, assign)IBOutlet NSProgressIndicator *progressofDay;
@property (nonatomic, assign)NSString *progresspercent;
@property (nonatomic, assign)IBOutlet NSTextField *percent;
@property (nonatomic, assign)IBOutlet NSTextField *staticpercent;
@property (nonatomic, assign)IBOutlet NSTextField *staticprogress;

@property (assign)IBOutlet NSWindow *window;
-(void)updateTimes:(NSTimer *)timer;

@end
