//
//  KMCountDownViewController.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/21/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMCountDownViewController.h"

#pragma mark Private Interface Method Declarations
@interface KMCountDownViewController ()
- (NSInteger)currentMinute;
- (NSInteger)currentHour;
- (NSInteger)currentSecond;
- (NSInteger)currentDay;

- (void)updateCount:(NSTimer *)timer;

@end

#pragma mark -
#pragma mark Awake from Nib
@implementation KMCountDownViewController





- (void)awakeFromNib{
    [_datepicker setDateValue:[NSDate date]];
    [_datepicker setMinDate:[NSDate date]];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSLocale *locale = [NSLocale currentLocale];
    [_datepicker setTimeZone:[calendar timeZone]];
    [_datepicker setLocale:locale];
    [_datepicker setCalendar:calendar];
    
    [_timerday setTextColor:[[KMConfiguration instance]TimeColor3]];
    [_timerhour setTextColor:[[KMConfiguration instance]TimeColor2]];
    [_timermin setTextColor:[[KMConfiguration instance]TimeColor2]];
    [_timersec setTextColor:[[KMConfiguration instance]TimeColor3]];
    [_tilldate setTextColor:[[KMConfiguration instance]TimeColor3]];
    [_timerlabel setTextColor:[[KMConfiguration instance]TimeColor4]];
    [_datepicker setTextColor:[[KMConfiguration instance]TimeColor3]];
    
}
#pragma mark -
#pragma mark DoCountDown issued on start segment
-(IBAction)doCountDown:(id)sender {
    NSInteger selectedSegment = [sender selectedSegment];
    NSInteger clickedSegmentTag = [[sender cell] tagForSegment:selectedSegment];
    
    switch (clickedSegmentTag)
    {
        case 0:
        {
            _counttime = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCount:)
                                           userInfo:nil
                                            repeats:YES];
            
         }
            break;
       
        case 1:
        {
            [_counttime invalidate];
            
            NSString * daystring = [NSString stringWithFormat:@"Days"];
            [_timerday setStringValue:daystring];
            
            NSString * hour = [NSString stringWithFormat:@"Hours"];
            [_timerhour setStringValue:hour];
            
            NSString * min = [NSString stringWithFormat:@"Minutes"];
            [_timermin setStringValue:min];
            
            NSString * sec = [NSString stringWithFormat:@"Seconds"];
            [_timersec setStringValue:sec];
            
            NSString * till = [NSString stringWithFormat:@"Target Date"];
            [_tilldate setStringValue:till];
            
            NSString * running = [NSString stringWithFormat:@"Running Total"];
            [_timerlabel setStringValue:running];
        }
            break;
            
        default:{}
            break;
    }
    
    
}

#pragma mark -
#pragma mark UpdateCount Method
- (void)updateCount:(NSTimer *)timer {
    
    if (![storedate isEqualToDate:[_datepicker dateValue]]){
    
        NSString * datestring = [NSString stringWithFormat:@"%@",[_datepicker dateValue]];
        NSString * timestring = [_timebox objectValueOfSelectedItem];
        NSString * grabDate = [datestring substringWithRange:NSMakeRange(0, 10)];
        NSTimeZone * localTimezone = [NSTimeZone systemTimeZone];
        //combostring = [NSString stringWithFormat:@"%@ %@ -0500",grabDate, timestring];

        if (localTimezone == [NSTimeZone timeZoneWithAbbreviation:@"CDT"]) {
            combostring = [NSString stringWithFormat:@"%@ %@ -0500",grabDate, timestring];
            displayDate = [combostring stringByReplacingOccurrencesOfString:@"-0500" withString:@""];
        }
        if (localTimezone == [NSTimeZone timeZoneWithAbbreviation:@"EDT"]) {
            combostring = [NSString stringWithFormat:@"%@ %@ -0400",grabDate, timestring];
            displayDate = [combostring stringByReplacingOccurrencesOfString:@"-0400" withString:@""];
        }
        if (localTimezone == [NSTimeZone timeZoneWithAbbreviation:@"MDT"]) {
            combostring = [NSString stringWithFormat:@"%@ %@ -0600",grabDate, timestring];
            displayDate = [combostring stringByReplacingOccurrencesOfString:@"-0600" withString:@""];
        }
        if (localTimezone == [NSTimeZone timeZoneWithAbbreviation:@"PDT"]) {
            combostring = [NSString stringWithFormat:@"%@ %@ -0700",grabDate, timestring];
            displayDate = [combostring stringByReplacingOccurrencesOfString:@"-0700" withString:@""];
        }
        
       
        
        [_tilldate setStringValue:displayDate];

        //[_datepicker setDateValue:[_datepicker dateValue]];
    storedate = [NSDate dateWithString:combostring];
    }

    if ([[[KMConfiguration instance]colorChangeSlide] isEqualToString:@"1"]){
        [_timerday setTextColor:[[KMConfiguration instance]TimeColor3]];
        [_timerhour setTextColor:[[KMConfiguration instance]TimeColor2]];
        [_timermin setTextColor:[[KMConfiguration instance]TimeColor2]];
        [_timersec setTextColor:[[KMConfiguration instance]TimeColor3]];
        [_tilldate setTextColor:[[KMConfiguration instance]TimeColor3]];
        [_timerlabel setTextColor:[[KMConfiguration instance]TimeColor4]];
        [_datepicker setTextColor:[[KMConfiguration instance]TimeColor3]];
        [[KMConfiguration instance]setColorChangeSlide:@"0"];
        [[KMConfiguration instance]saveSettings];
    }
    
    
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    [DateFormatter setCalendar:[NSCalendar currentCalendar]];
    NSLocale* formatterLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    [DateFormatter setLocale:formatterLocale];
    [DateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    _correctDateString = [DateFormatter stringFromDate:[NSDate date]];
    correctDate = [DateFormatter dateFromString:_correctDateString];
#pragma mark -
#pragma mark Date Components
    NSDateComponents * components = [[NSCalendar currentCalendar] components: NSDayCalendarUnit
                                                 fromDate:correctDate toDate:storedate options: 0];
    NSInteger days = [components day];
    
    NSDateComponents * hourcomponent = [[NSCalendar currentCalendar]components : NSHourCalendarUnit fromDate:correctDate toDate:storedate options:0];
    NSInteger hour = [hourcomponent hour];
    
    NSDateComponents * mincomponent = [[NSCalendar currentCalendar]components : NSMinuteCalendarUnit fromDate:correctDate toDate:storedate options:0];
    NSInteger min = [mincomponent minute];
    
    NSDateComponents * seccomponent = [[NSCalendar currentCalendar]components : NSSecondCalendarUnit fromDate:correctDate toDate:storedate options:0];
    NSInteger sec = [seccomponent second];
#pragma mark -
#pragma mark if > or < for days , min , secs
    if (sec<=10) {
        secondpadding = [NSString stringWithFormat:@"0%ld",sec];
    }
    if (sec>=10) {
        secondpadding = [NSString stringWithFormat:@"%ld", sec];
    }
    
    if (min<=10) {
        minutepadding = [NSString stringWithFormat:@"0%ld",min];
    }
    if (min>=10) {
        minutepadding = [NSString stringWithFormat:@"%ld", min];
    }
    
    if(days >= 2){
        
    
    NSString * daystring = [NSString stringWithFormat:@"%ld Days",days];
    [_timerday setStringValue:daystring];
        
        }
    
    if (days == 1){
        NSString * daystring = [NSString stringWithFormat:@"%ld Day",days];
        [_timerday setStringValue:daystring];
    }
    
    if (days == 0){
        NSString * daystring = [NSString stringWithFormat:@"%ld Days",days];
        [_timerday setStringValue:daystring];
    }

#pragma mark -   
#pragma mark Set timer labels to values
    NSString * future = [NSString stringWithFormat:@"%ld Hrs", hour];
    [_timerhour setStringValue:future];
    NSString * future2 = [NSString stringWithFormat:@"%@ Mins", minutepadding];
    [_timermin setStringValue:future2];
    NSString * future3 = [NSString stringWithFormat:@"%@ Secs", secondpadding];
    [_timersec setStringValue:future3];
    
#pragma mark -   
#pragma mark Running Total Label
    int seconds = [[NSString stringWithFormat:@"%@",secondpadding]intValue];
    int mins = seconds/60;
    int hours = mins/60;
    int day = hours/24;
    counterseconds = (seconds - mins * 60);
    counterminutes = (mins - hours * 60);
    counterhours = (hours - day * 24);
    
    if (counterseconds<=10) {
        counterSecondsPadding = [NSString stringWithFormat:@"0%u",counterseconds];
    }
    if (counterseconds>=10) {
        counterSecondsPadding = [NSString stringWithFormat:@"%u",counterseconds];
    }
    if (counterminutes<=10) {
        counterMinutesPadding = [NSString stringWithFormat:@"0%u",counterminutes];
    }
    if (counterminutes>=10) {
        counterMinutesPadding = [NSString stringWithFormat:@"%u",counterminutes];
    }
    if (counterhours<=10) {
        counterHoursPadding = [NSString stringWithFormat:@"0%u",counterhours];
    }
    if (counterhours>=10) {
        counterHoursPadding = [NSString stringWithFormat:@"%u",counterhours];
    }

    NSString * runningTotal = [NSString stringWithFormat:@"%u:%@:%@:%@",day,counterHoursPadding,counterMinutesPadding, counterSecondsPadding];
    [_timerlabel setStringValue:runningTotal];
#pragma mark -
#pragma mark End of Count Down
    if (seconds == 0) {
        [_counttime invalidate];
        NSAlert * non = [NSAlert alertWithMessageText:@"Finished Count Down!" defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [non runModal];
    }

    
}



#pragma mark -
#pragma mark clear method
-(IBAction)clearCount:(id)sender {
    
    [_counttime invalidate];
    
    NSString * daystring = [NSString stringWithFormat:@"Days"];
    [_timerday setStringValue:daystring];

    NSString * hour = [NSString stringWithFormat:@"Hours"];
    [_timerhour setStringValue:hour];
    
    NSString * min = [NSString stringWithFormat:@"Minutes"];
    [_timermin setStringValue:min];
    
    NSString * sec = [NSString stringWithFormat:@"Seconds"];
    [_timersec setStringValue:sec];
    
    NSString * till = [NSString stringWithFormat:@"Target Date"];
    [_tilldate setStringValue:till];
    
    NSString * running = [NSString stringWithFormat:@"Running Total"];
    [_timerlabel setStringValue:running];
    
}
#pragma mark -
#pragma mark Current Measurements for time
-(NSInteger)currentHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
    
}

-(NSInteger)currentMinute {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSMinuteCalendarUnit fromDate:now];
    
    return [components minute];
    
}

-(NSInteger)currentSecond {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSSecondCalendarUnit fromDate:now];
    
    return [components second];
    
}

-(NSInteger)currentDay {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSDayCalendarUnit fromDate:now];
    
    return [components day];
    
}


@end

