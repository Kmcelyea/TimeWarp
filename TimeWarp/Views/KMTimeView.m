//
//  KMTimeView.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMTimeView.h"
#import "KMClock.h"


#pragma mark -
#pragma mark Private Interface Declaractions
@interface KMTimeView ()

-(void)updateTimes:(NSTimer *)timer;

@end

#pragma mark -
#pragma mark Initialization
@implementation KMTimeView
@synthesize LocalTime = _LocalTime;
@synthesize localcounter = _localcounter;




-(void)awakeFromNib{
    [self loadViewTimes];
    [_localTitle setTextColor:[[KMConfiguration instance]localTimeColor]];
    [_secondTitle setTextColor:[[KMConfiguration instance]TimeColor2]];
     [_thirdTitle setTextColor:[[KMConfiguration instance]TimeColor3]];
     [_fourthTitle setTextColor:[[KMConfiguration instance]TimeColor4]];
    [_LocalTime setTextColor:[[KMConfiguration instance]localTimeColor]];
     [_SecondTime setTextColor:[[KMConfiguration instance]TimeColor2]];
     [_ThirdTime setTextColor:[[KMConfiguration instance]TimeColor3]];
     [_FourthTime setTextColor:[[KMConfiguration instance]TimeColor4]];
    [_ShowHide setTextColor:[[KMConfiguration instance]TimeColor2]];
}






#pragma mark -
#pragma mark Load View for Times
-(void)loadViewTimes {
    
    if ([self currentSecond]<=10) {
        secondpadding = [NSString stringWithFormat:@"0%ld",[self currentSecond]];
    }
    if ([self currentSecond]>=10) {
        secondpadding = [NSString stringWithFormat:@"%ld", [self currentSecond]];
    }
    
    if ([self currentMinute]<=10) {
        minutepadding = [NSString stringWithFormat:@"0%ld",[self currentMinute]];
    }
    if ([self currentMinute]>=10) {
        minutepadding = [NSString stringWithFormat:@"%ld", [self currentMinute]];
    }
    
    
    
    NSString * local = [NSString stringWithFormat:@"%@  %ld:%@:%@ %@",[[KMClock instance]getLocalTime], [self currentHour],minutepadding,secondpadding, [self LocalTZAbbreviation]];
    [_LocalTime setStringValue:local];
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    
    
    if ([saveAbbreviation isEqualToString:@"CDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]-1,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-2,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"East"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
       _localcounter = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
        
    }
    
    if ([saveAbbreviation isEqualToString:@"EDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]-1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]-2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-3,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
       _localcounter = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    if ([saveAbbreviation isEqualToString:@"MDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        _localcounter = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    if ([saveAbbreviation isEqualToString:@"PDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]+2,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+3,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]+1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Mountain"];
        
        _localcounter = [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    
    if (![saveAbbreviation isEqualToString:@"CDT"] && ![saveAbbreviation isEqualToString:@"PDT"] && ![saveAbbreviation isEqualToString:@"MDT"] && ![saveAbbreviation isEqualToString:@"EDT"]){
        
        NSAlert * non = [NSAlert alertWithMessageText:@"Only Support for USA: CDT,PDT,EDT,MDT Closing..." defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
        [non runModal];
        [NSApp terminate:nil];
        
        
    }

}

#pragma mark -
#pragma mark Update Times
-(void)updateTimes:(NSTimer *)timer {
    
    
    if ([[[KMConfiguration instance]colorChange] isEqualToString:@"1"]) {
        [_localTitle setTextColor:[[KMConfiguration instance]localTimeColor]];
        [_secondTitle setTextColor:[[KMConfiguration instance]TimeColor2]];
        [_thirdTitle setTextColor:[[KMConfiguration instance]TimeColor3]];
        [_fourthTitle setTextColor:[[KMConfiguration instance]TimeColor4]];
        [_LocalTime setTextColor:[[KMConfiguration instance]localTimeColor]];
        [_SecondTime setTextColor:[[KMConfiguration instance]TimeColor2]];
        [_ThirdTime setTextColor:[[KMConfiguration instance]TimeColor3]];
        [_FourthTime setTextColor:[[KMConfiguration instance]TimeColor4]];
        [_ShowHide setTextColor:[[KMConfiguration instance]TimeColor2]];
        [[KMConfiguration instance]setColorChange:@"0"];
        [[KMConfiguration instance]saveSettings];
    }
    
    
    if ([self currentSecond]<=10) {
        secondpadding = [NSString stringWithFormat:@"0%ld",[self currentSecond]];
    }
    if ([self currentSecond]>=10) {
        secondpadding = [NSString stringWithFormat:@"%ld", [self currentSecond]];
    }
    
    if ([self currentMinute]<=10) {
        minutepadding = [NSString stringWithFormat:@"0%ld",[self currentMinute]];
    }
    if ([self currentMinute]>=10) {
        minutepadding = [NSString stringWithFormat:@"%ld", [self currentMinute]];
    }
    
    
    
    NSString * local = [NSString stringWithFormat:@"%@  %ld:%@:%@ %@",[[KMClock instance]getLocalTime], [self currentHour],minutepadding,secondpadding, [self LocalTZAbbreviation]];
    [_LocalTime setStringValue:local];
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    
    
    if ([saveAbbreviation isEqualToString:@"CDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]-1,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-2,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"East"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"EDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]-1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]-2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-3,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"MDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ PDT",[[KMClock instance]getPDT], [self currentHour]-1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"PDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%@  %ld:%@:%@ CDT",[[KMClock instance]getCDT], [self currentHour]+2,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%@  %ld:%@:%@ EDT",[[KMClock instance]getEDT], [self currentHour]+3,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%@  %ld:%@:%@ MDT",[[KMClock instance]getMDT], [self currentHour]+1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Mountain"];
        
        
    }
    
    
}

#pragma mark -
#pragma mark Current time component methods
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

-(NSString *)LocalTZAbbreviation {
    NSTimeZone * localTZ = [NSTimeZone localTimeZone];
    
    return [localTZ abbreviation];
    
    
}

@end
