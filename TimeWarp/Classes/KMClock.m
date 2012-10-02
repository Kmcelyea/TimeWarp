//
//  KMClock.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMClock.h"

@implementation KMClock


+ (KMClock *)instance {
    static KMClock *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KMClock alloc] init ];
    });
    
    return _instance;
}




-(NSString *)getTime{
    if ([self currentSecond]<=10) {
        _secondpadding = [NSString stringWithFormat:@"0%ld",[self currentSecond]];
    }
    if ([self currentSecond]>=10) {
        _secondpadding = [NSString stringWithFormat:@"%ld", [self currentSecond]];
    }
    
    if ([self currentMinute]<=10) {
        _minutepadding = [NSString stringWithFormat:@"0%ld",[self currentMinute]];
    }
    if ([self currentMinute]>=10) {
        _minutepadding = [NSString stringWithFormat:@"%ld", [self currentMinute]];
    }
   
    _theTime = [NSString stringWithFormat:@"%ld:%@:%@ %@", [self currentHour],_minutepadding,_secondpadding, [self LocalTZAbbreviation]];
    
    return _theTime;
}


-(NSString *)getLocalTime{

    _theLocalTime = [NSString stringWithFormat:@"%@", [self currentAMPMHour]];
    
    return _theLocalTime;
}

-(NSString *)getEDT{

    _theEDT = [NSString stringWithFormat:@"%@", [self currentEDTHour]];
    
    return _theEDT;
}

-(NSString *)getMDT{
    
    _theMDT = [NSString stringWithFormat:@"%@", [self currentMDTHour]];
    
    return _theMDT;
}

-(NSString *)getPDT{
    
    _thePDT = [NSString stringWithFormat:@"%@", [self currentPDTHour]];
    
    return _thePDT;
}

-(NSString *)getCDT{
    
    _theCDT = [NSString stringWithFormat:@"%@", [self currentCDTHour]];
    
    return _theCDT;
}

#pragma mark -
#pragma mark Current time component methods
-(NSInteger)currentHour {
    
    NSDate *now = [NSDate date];
    
    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:@"CDT"];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setTimeZone:timezone];
    
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
    
}

-(NSString *)currentAMPMHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    
    NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]];
    if ([components hour] > 12) {
        if ([components hour] == 12) {
            return @"12 PM";
        }
        if ([components hour] == 13) {
            return @"1 PM";
        }
        if ([components hour] == 14) {
            return @"2 PM";
        }
        if ([components hour] == 15) {
            return @"3 PM";
        }
        if ([components hour] == 16) {
            return @"4 PM";
        }
        if ([components hour] == 17) {
            return @"5 PM";
        }
        if ([components hour] == 18) {
            return @"6 PM";
        }
        if ([components hour] == 19) {
            return @"7 PM";
        }
        if ([components hour] == 20) {
            return @"8 PM";
        }
        if ([components hour] == 21) {
            return @"9 PM";
        }
        if ([components hour] == 22) {
            return @"10 PM";
        }
        if ([components hour] == 23) {
            return @"11 PM";
        }
        if ([components hour] == 24) {
            return @"12 AM";
        }
        else return @"UNDEFINED";
    }
    return componenthour;
}
-(NSString *)currentEDTHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
    NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+1];
    if ([components hour]+1 > 12) {
        if ([components hour]+1 == 12) {
            return @"12 PM";
        }
        if ([components hour]+1 == 13) {
            return @"1 PM";
        }
        if ([components hour]+1 == 14) {
            return @"2 PM";
        }
        if ([components hour]+1 == 15) {
            return @"3 PM";
        }
        if ([components hour]+1 == 16) {
            return @"4 PM";
        }
        if ([components hour]+1 == 17) {
            return @"5 PM";
        }
        if ([components hour]+1 == 18) {
            return @"6 PM";
        }
        if ([components hour]+1 == 19) {
            return @"7 PM";
        }
        if ([components hour]+1 == 20) {
            return @"8 PM";
        }
        if ([components hour]+1 == 21) {
            return @"9 PM";
        }
        if ([components hour]+1 == 22) {
            return @"10 PM";
        }
        if ([components hour]+1 == 23) {
            return @"11 PM";
        }
        if ([components hour]+1 == 24) {
            return @"12 AM";
        }
        else return @"UNDEFINED";
    }
    return componenthour;
}
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+2];
        if ([components hour]+2 > 12) {
            if ([components hour]+2 == 12) {
                return @"12 PM";
            }
            if ([components hour]+2 == 13) {
                return @"1 PM";
            }
            if ([components hour]+2 == 14) {
                return @"2 PM";
            }
            if ([components hour]+2 == 15) {
                return @"3 PM";
            }
            if ([components hour]+2 == 16) {
                return @"4 PM";
            }
            if ([components hour]+2 == 17) {
                return @"5 PM";
            }
            if ([components hour]+2 == 18) {
                return @"6 PM";
            }
            if ([components hour]+2 == 19) {
                return @"7 PM";
            }
            if ([components hour]+2 == 20) {
                return @"8 PM";
            }
            if ([components hour]+2 == 21) {
                return @"9 PM";
            }
            if ([components hour]+2 == 22) {
                return @"10 PM";
            }
            if ([components hour]+2 == 23) {
                return @"11 PM";
            }
            if ([components hour]+2 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"PDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+3];
        if ([components hour]+3 > 12) {
            if ([components hour]+3 == 12) {
                return @"12 PM";
            }
            if ([components hour]+3 == 13) {
                return @"1 PM";
            }
            if ([components hour]+3 == 14) {
                return @"2 PM";
            }
            if ([components hour]+3 == 15) {
                return @"3 PM";
            }
            if ([components hour]+3 == 16) {
                return @"4 PM";
            }
            if ([components hour]+3 == 17) {
                return @"5 PM";
            }
            if ([components hour]+3 == 18) {
                return @"6 PM";
            }
            if ([components hour]+3 == 19) {
                return @"7 PM";
            }
            if ([components hour]+3 == 20) {
                return @"8 PM";
            }
            if ([components hour]+3 == 21) {
                return @"9 PM";
            }
            if ([components hour]+3 == 22) {
                return @"10 PM";
            }
            if ([components hour]+3 == 23) {
                return @"11 PM";
            }
            if ([components hour]+3 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    else return @"0 AM";
}
-(NSString *)currentPDTHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-2];
        if ([components hour]-2 > 12) {
            if ([components hour]-2 == 12) {
                return @"12 PM";
            }
            if ([components hour]-2 == 13) {
                return @"1 PM";
            }
            if ([components hour]-2 == 14) {
                return @"2 PM";
            }
            if ([components hour]-2 == 15) {
                return @"3 PM";
            }
            if ([components hour]-2 == 16) {
                return @"4 PM";
            }
            if ([components hour]-2 == 17) {
                return @"5 PM";
            }
            if ([components hour]-2 == 18) {
                return @"6 PM";
            }
            if ([components hour]-2 == 19) {
                return @"7 PM";
            }
            if ([components hour]-2 == 20) {
                return @"8 PM";
            }
            if ([components hour]-2 == 21) {
                return @"9 PM";
            }
            if ([components hour]-2 == 22) {
                return @"10 PM";
            }
            if ([components hour]-2 == 23) {
                return @"11 PM";
            }
            if ([components hour]-2 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-1];
        if ([components hour]-1 > 12) {
            if ([components hour]-1 == 12) {
                return @"12 PM";
            }
            if ([components hour]-1 == 13) {
                return @"1 PM";
            }
            if ([components hour]-1 == 14) {
                return @"2 PM";
            }
            if ([components hour]-1 == 15) {
                return @"3 PM";
            }
            if ([components hour]-1 == 16) {
                return @"4 PM";
            }
            if ([components hour]-1 == 17) {
                return @"5 PM";
            }
            if ([components hour]-1 == 18) {
                return @"6 PM";
            }
            if ([components hour]-1 == 19) {
                return @"7 PM";
            }
            if ([components hour]-1 == 20) {
                return @"8 PM";
            }
            if ([components hour]-1 == 21) {
                return @"9 PM";
            }
            if ([components hour]-1 == 22) {
                return @"10 PM";
            }
            if ([components hour]-1 == 23) {
                return @"11 PM";
            }
            if ([components hour]-1 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-3];
        if ([components hour]-3 > 12) {
            if ([components hour]-3 == 12) {
                return @"12 PM";
            }
            if ([components hour]-3 == 13) {
                return @"1 PM";
            }
            if ([components hour]-3 == 14) {
                return @"2 PM";
            }
            if ([components hour]-3 == 15) {
                return @"3 PM";
            }
            if ([components hour]-3 == 16) {
                return @"4 PM";
            }
            if ([components hour]-3 == 17) {
                return @"5 PM";
            }
            if ([components hour]-3 == 18) {
                return @"6 PM";
            }
            if ([components hour]-3 == 19) {
                return @"7 PM";
            }
            if ([components hour]-3 == 20) {
                return @"8 PM";
            }
            if ([components hour]-3 == 21) {
                return @"9 PM";
            }
            if ([components hour]-3 == 22) {
                return @"10 PM";
            }
            if ([components hour]-3 == 23) {
                return @"11 PM";
            }
            if ([components hour]-3 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    else return @"0 AM";
    
}

-(NSString *)currentMDTHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-1];
        if ([components hour]-1 > 12) {
            if ([components hour]-1 == 12) {
                return @"12 PM";
            }
            if ([components hour]-1 == 13) {
                return @"1 PM";
            }
            if ([components hour]-1 == 14) {
                return @"2 PM";
            }
            if ([components hour]-1 == 15) {
                return @"3 PM";
            }
            if ([components hour]-1 == 16) {
                return @"4 PM";
            }
            if ([components hour]-1 == 17) {
                return @"5 PM";
            }
            if ([components hour]-1 == 18) {
                return @"6 PM";
            }
            if ([components hour]-1 == 19) {
                return @"7 PM";
            }
            if ([components hour]-1 == 20) {
                return @"8 PM";
            }
            if ([components hour]-1 == 21) {
                return @"9 PM";
            }
            if ([components hour]-1 == 22) {
                return @"10 PM";
            }
            if ([components hour]-1 == 23) {
                return @"11 PM";
            }
            if ([components hour]-1 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-2];
        if ([components hour]-2 > 12) {
            if ([components hour]-2 == 12) {
                return @"12 PM";
            }
            if ([components hour]-2 == 13) {
                return @"1 PM";
            }
            if ([components hour]-2 == 14) {
                return @"2 PM";
            }
            if ([components hour]-2 == 15) {
                return @"3 PM";
            }
            if ([components hour]-2 == 16) {
                return @"4 PM";
            }
            if ([components hour]-2 == 17) {
                return @"5 PM";
            }
            if ([components hour]-2 == 18) {
                return @"6 PM";
            }
            if ([components hour]-2 == 19) {
                return @"7 PM";
            }
            if ([components hour]-2 == 20) {
                return @"8 PM";
            }
            if ([components hour]-2 == 21) {
                return @"9 PM";
            }
            if ([components hour]-2 == 22) {
                return @"10 PM";
            }
            if ([components hour]-2 == 23) {
                return @"11 PM";
            }
            if ([components hour]-2 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"PDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+1];
        if ([components hour]+1 > 12) {
            if ([components hour]+1 == 12) {
                return @"12 PM";
            }
            if ([components hour]+1 == 13) {
                return @"1 PM";
            }
            if ([components hour]+1 == 14) {
                return @"2 PM";
            }
            if ([components hour]+1 == 15) {
                return @"3 PM";
            }
            if ([components hour]+1 == 16) {
                return @"4 PM";
            }
            if ([components hour]+1 == 17) {
                return @"5 PM";
            }
            if ([components hour]+1 == 18) {
                return @"6 PM";
            }
            if ([components hour]+1 == 19) {
                return @"7 PM";
            }
            if ([components hour]+1 == 20) {
                return @"8 PM";
            }
            if ([components hour]+1 == 21) {
                return @"9 PM";
            }
            if ([components hour]+1 == 22) {
                return @"10 PM";
            }
            if ([components hour]+1 == 23) {
                return @"11 PM";
            }
            if ([components hour]+1 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    else return @"0 AM";
}
-(NSString *)currentCDTHour {
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"PDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+2];
        if ([components hour]+2 > 12) {
            if ([components hour]+2 == 12) {
                return @"12 PM";
            }
            if ([components hour]+2 == 13) {
                return @"1 PM";
            }
            if ([components hour]+2 == 14) {
                return @"2 PM";
            }
            if ([components hour]+2 == 15) {
                return @"3 PM";
            }
            if ([components hour]+2 == 16) {
                return @"4 PM";
            }
            if ([components hour]+2 == 17) {
                return @"5 PM";
            }
            if ([components hour]+2 == 18) {
                return @"6 PM";
            }
            if ([components hour]+2 == 19) {
                return @"7 PM";
            }
            if ([components hour]+2 == 20) {
                return @"8 PM";
            }
            if ([components hour]+2 == 21) {
                return @"9 PM";
            }
            if ([components hour]+2 == 22) {
                return @"10 PM";
            }
            if ([components hour]+2 == 23) {
                return @"11 PM";
            }
            if ([components hour]+2 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]+1];
        if ([components hour]+1 > 12) {
            if ([components hour]+1 == 12) {
                return @"12 PM";
            }
            if ([components hour]+1 == 13) {
                return @"1 PM";
            }
            if ([components hour]+1 == 14) {
                return @"2 PM";
            }
            if ([components hour]+1 == 15) {
                return @"3 PM";
            }
            if ([components hour]+1 == 16) {
                return @"4 PM";
            }
            if ([components hour]+1 == 17) {
                return @"5 PM";
            }
            if ([components hour]+1 == 18) {
                return @"6 PM";
            }
            if ([components hour]+1 == 19) {
                return @"7 PM";
            }
            if ([components hour]+1 == 20) {
                return @"8 PM";
            }
            if ([components hour]+1 == 21) {
                return @"9 PM";
            }
            if ([components hour]+1 == 22) {
                return @"10 PM";
            }
            if ([components hour]+1 == 23) {
                return @"11 PM";
            }
            if ([components hour]+1 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld AM",[components hour]-1];
        if ([components hour]-1 > 12) {
            if ([components hour]-1 == 12) {
                return @"12 PM";
            }
            if ([components hour]-1 == 13) {
                return @"1 PM";
            }
            if ([components hour]-1 == 14) {
                return @"2 PM";
            }
            if ([components hour]-1 == 15) {
                return @"3 PM";
            }
            if ([components hour]-1 == 16) {
                return @"4 PM";
            }
            if ([components hour]-1 == 17) {
                return @"5 PM";
            }
            if ([components hour]-1 == 18) {
                return @"6 PM";
            }
            if ([components hour]-1 == 19) {
                return @"7 PM";
            }
            if ([components hour]-1 == 20) {
                return @"8 PM";
            }
            if ([components hour]-1 == 21) {
                return @"9 PM";
            }
            if ([components hour]-1 == 22) {
                return @"10 PM";
            }
            if ([components hour]-1 == 23) {
                return @"11 PM";
            }
            if ([components hour]-1 == 24) {
                return @"12 AM";
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    else return @"0 AM";
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


-(double)currentprogresshour {
    
    NSDate *now = [NSDate date];

    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];

    NSDateComponents * components = [calendar components:NSHourCalendarUnit fromDate:now];
    
    return [components hour];
    
}

@end
