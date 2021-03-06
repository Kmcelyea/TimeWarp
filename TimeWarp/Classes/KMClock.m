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
    
    NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour],_minutepadding,_secondpadding];
    if ([components hour] == 12) {
        return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
    }
    if ([components hour] > 12) {
        
        if ([components hour] == 13) {
            return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 14) {
            return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 15) {
            return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 16) {
            return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 17) {
            return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 18) {
            return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 19) {
            return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 20) {
            return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 21) {
            return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 22) {
            return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 23) {
            return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour] == 24) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
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
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
    NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+1,_minutepadding,_secondpadding];
        if ([components hour]+1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 > 12) {
        
        if ([components hour]+1 == 13) {
            return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 14) {
            return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 15) {
            return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 16) {
            return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 17) {
            return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 18) {
            return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 19) {
            return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 20) {
            return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 21) {
            return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 22) {
            return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 23) {
            return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 == 24) {
            return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
        }
        else return @"UNDEFINED";
    }
    return componenthour;
}
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+2,_minutepadding,_secondpadding];
        if ([components hour]+2 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+2 > 12) {
            
            if ([components hour]+2 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"PDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+3,_minutepadding,_secondpadding];
        if ([components hour]+3 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+3 > 12) {
            
            if ([components hour]+3 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+3 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
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
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-2,_minutepadding,_secondpadding];
        if ([components hour]-2 == 12) {
             return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-2 > 12) {
            if ([components hour]-2 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-1,_minutepadding,_secondpadding];
        if ([components hour]-1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-1 > 12) {
            
            if ([components hour]-1 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 19) {
               return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-3,_minutepadding,_secondpadding];
        if ([components hour]-3 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-3 > 12) {
            
            if ([components hour]-3 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-3 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
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
    
    NSString * saveAbbreviation = [self LocalTZAbbreviation];
    if ([saveAbbreviation isEqualToString:@"CDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-1,_minutepadding,_secondpadding];
        if ([components hour]-1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-1 > 12) {
            
            if ([components hour]-1 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 15) {
               return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 19) {
               return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 20) {
               return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-2,_minutepadding,_secondpadding];
        if ([components hour]-2 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-2 > 12) {
            
            if ([components hour]-2 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 18) {
               return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-2 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"PDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+1,_minutepadding,_secondpadding];
        if ([components hour]+1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 > 12) {
            
            if ([components hour]+1 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
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
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+2,_minutepadding,_secondpadding];
        if ([components hour]+2 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+2 > 12) {
            
            if ([components hour]+2 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 22) {
               return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];;
            }
            if ([components hour]+2 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+2 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"MDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]+1,_minutepadding,_secondpadding];
        if ([components hour]+1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]+1 > 12) {
            
            if ([components hour]+1 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 19) {
               return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 23) {
                return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]+1 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
            }
            else return @"UNDEFINED";
        }
        return componenthour;
    }
    if ([saveAbbreviation isEqualToString:@"EDT"]) {
        NSString *componenthour = [NSString stringWithFormat:@"%ld:%@:%@ AM",[components hour]-1,_minutepadding,_secondpadding];
        if ([components hour]-1 == 12) {
            return [NSString stringWithFormat:@"12:%@:%@ PM",_minutepadding,_secondpadding];
        }
        if ([components hour]-1 > 12) {
            
            if ([components hour]-1 == 13) {
                return [NSString stringWithFormat:@"1:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 14) {
                return [NSString stringWithFormat:@"2:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 15) {
                return [NSString stringWithFormat:@"3:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 16) {
                return [NSString stringWithFormat:@"4:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 17) {
                return [NSString stringWithFormat:@"5:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 18) {
                return [NSString stringWithFormat:@"6:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 19) {
                return [NSString stringWithFormat:@"7:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 20) {
                return [NSString stringWithFormat:@"8:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 21) {
                return [NSString stringWithFormat:@"9:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 22) {
                return [NSString stringWithFormat:@"10:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 23) {
               return [NSString stringWithFormat:@"11:%@:%@ PM",_minutepadding,_secondpadding];
            }
            if ([components hour]-1 == 24) {
                return [NSString stringWithFormat:@"12:%@:%@ AM",_minutepadding,_secondpadding];
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
-(double)currentprogressmin {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSMinuteCalendarUnit fromDate:now];
    
    return [components minute];
    
}

-(double)currentprogressSec {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSSecondCalendarUnit fromDate:now];
    
    return [components second];
    
}
@end
