//
//  KMTimeView.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMTimeView.h"

@interface KMTimeView ()



@end

@implementation KMTimeView
@synthesize LocalTime = _LocalTime;
@synthesize localcounter = _localcounter;

-(void)awakeFromNib{
    [self loadViewTimes];
    
}


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
    
    
    
    NSString * local = [NSString stringWithFormat:@"%ld:%ld:%@ %@", [self currentHour],[self currentMinute],secondpadding, [self LocalTZAbbreviation]];
    [_LocalTime setStringValue:local];
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    
    
    if ([saveAbbreviation isEqualToString:@"CDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]-1,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-2,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"East"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
        
    }
    
    if ([saveAbbreviation isEqualToString:@"EDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]-1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]-2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-3,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    if ([saveAbbreviation isEqualToString:@"MDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0
                                         target:self
                                       selector:@selector(updateTimes:)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    if ([saveAbbreviation isEqualToString:@"PDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]+2,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+3,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]+1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Mountain"];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0
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

-(void)updateTimes:(NSTimer *)timer {
    
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
    
    
    
    NSString * local = [NSString stringWithFormat:@"%ld:%ld:%@ %@", [self currentHour],[self currentMinute],secondpadding, [self LocalTZAbbreviation]];
    [_LocalTime setStringValue:local];
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    
    
    if ([saveAbbreviation isEqualToString:@"CDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]-1,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-2,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"East"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"EDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]-1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]-2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-3,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"Mountain"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"MDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]+1,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+2,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ PDT", [self currentHour]-1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Pacific"];
        
        
    }
    
    if ([saveAbbreviation isEqualToString:@"PDT"])
    {
        NSString * second = [NSString stringWithFormat:@"%ld:%@:%@ CDT", [self currentHour]+2,minutepadding,secondpadding];
        NSString * third = [NSString stringWithFormat:@"%ld:%@:%@ EDT", [self currentHour]+3,minutepadding,secondpadding];
        NSString * fourth = [NSString stringWithFormat:@"%ld:%@:%@ MDT", [self currentHour]+1,minutepadding,secondpadding];
        
        [_SecondTime setStringValue:second];
        [_ThirdTime setStringValue:third];
        [_FourthTime setStringValue:fourth];
        [_secondTitle setStringValue:@"Central"];
        [_thirdTitle setStringValue:@"East"];
        [_fourthTitle setStringValue:@"Mountain"];
        
        
    }
    
    
}

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
