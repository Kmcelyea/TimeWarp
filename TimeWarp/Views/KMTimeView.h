//
//  KMTimeView.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMTimeView : NSViewController
{
    
    NSString *secondpadding;
    NSString *minutepadding;
}
//Time Title//
@property(nonatomic, weak)IBOutlet NSTextField * secondTitle;
@property(nonatomic, weak)IBOutlet NSTextField * thirdTitle;
@property(nonatomic, weak)IBOutlet NSTextField * fourthTitle;


//Time Text//

@property(nonatomic , weak)IBOutlet NSTextField * LocalTime;
@property(nonatomic , weak)IBOutlet NSTextField * SecondTime;
@property(nonatomic , weak)IBOutlet NSTextField * ThirdTime;
@property(nonatomic , weak)IBOutlet NSTextField * FourthTime;



@property(nonatomic , weak)NSTimer * localcounter;


@end
