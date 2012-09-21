//
//  KMCountDownViewController.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/21/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMCountDownViewController : NSViewController
{
    NSString *secondpadding;
    NSString *minutepadding;
    NSTimer *counttime;
    NSDate *storedate;
    
}


@property (nonatomic, weak)IBOutlet NSSegmentedControl *countsegment;
@property (nonatomic, weak)IBOutlet NSComboBox *timebox;
@property (nonatomic, weak)IBOutlet NSDatePicker *datepicker;
@property (nonatomic, weak)IBOutlet NSTextField *timerlabel;
@property (nonatomic, weak)IBOutlet NSTextField *timerday;
@property (nonatomic, weak)IBOutlet NSTextField *timerhour;
@property (nonatomic, weak)IBOutlet NSTextField *timermin;
@property (nonatomic, weak)IBOutlet NSTextField *timersec;
@property (nonatomic, weak)IBOutlet NSTextField *tilldate;




-(IBAction)doCountDown:(id)sender;
-(IBAction)clearCount:(id)sender;

@end
