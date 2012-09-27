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
//Local Title and Time Text//
@property(nonatomic)IBOutlet NSTextField * localTitle;
@property(nonatomic)IBOutlet NSTextField * localTime;


//Time Title//
@property(nonatomic)IBOutlet NSTextField * secondTitle;
@property(nonatomic)IBOutlet NSTextField * thirdTitle;
@property(nonatomic)IBOutlet NSTextField * fourthTitle;


//Time Text//

@property(nonatomic)IBOutlet NSTextField * LocalTime;
@property(nonatomic)IBOutlet NSTextField * SecondTime;
@property(nonatomic)IBOutlet NSTextField * ThirdTime;
@property(nonatomic)IBOutlet NSTextField * FourthTime;


@property(nonatomic , strong)NSTimer * localcounter;



+ (KMTimeView *)instance;

@end
