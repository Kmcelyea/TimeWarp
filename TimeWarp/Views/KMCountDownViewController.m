//
//  KMCountDownViewController.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/21/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMCountDownViewController.h"

@interface KMCountDownViewController ()
- (NSInteger)currentMinute;
- (NSInteger)currentHour;
- (NSInteger)currentSecond;
- (NSInteger)currentDay;

- (void)updateCount;

@end

@implementation KMCountDownViewController

- (void)awakeFromNib{
    [_datepicker setDateValue:[NSDate date]];
    [_datepicker setMinDate:[NSDate date]];
    
}



-(IBAction)doCountDown:(id)sender {
    NSInteger selectedSegment = [sender selectedSegment];
    NSInteger clickedSegmentTag = [[sender cell] tagForSegment:selectedSegment];
    
    switch (clickedSegmentTag)
    {
        case 0:
            NSLog(@"%@, %@", [_timebox objectValueOfSelectedItem], [_datepicker dateValue]);
            counttime = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCount:)
                                           userInfo:nil
                                            repeats:YES];
            break;
        case 1:
            [counttime invalidate];
            break;
            
        default:
            break;
    }
    
    
}

- (void)updateCount:(NSTimer *)timer {
    
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    //[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString * datestring = [NSString stringWithFormat:@"%@",[_datepicker dateValue]];
    NSString * nowdatestring = [NSString stringWithFormat:@"%@",[NSDate date]];
    NSLog(@"datestring %@",datestring);
    NSLog(@"nowdatestring %@",nowdatestring);
    NSDate * now = [dateFormatter dateFromString:nowdatestring];
    NSDate * then = [dateFormatter dateFromString:datestring];
    NSTimeInterval futureCombined = [then timeIntervalSinceDate:now];
    NSLog(@"%f combined", futureCombined);
    
    
    NSDateComponents * components = [[NSCalendar currentCalendar] components: NSDayCalendarUnit
                                                 fromDate:[NSDate date] toDate:[_datepicker dateValue] options: 0];
    NSInteger days = [components day];
    
    NSDateComponents * hourcomponent = [[NSCalendar currentCalendar]components : NSHourCalendarUnit fromDate:[NSDate date]toDate:[_datepicker dateValue] options:0];
    NSInteger hour = [hourcomponent hour];
    
    NSDateComponents * mincomponent = [[NSCalendar currentCalendar]components : NSMinuteCalendarUnit fromDate:[NSDate date]toDate:[_datepicker dateValue] options:0];
    NSInteger min = [mincomponent minute];
    
    NSDateComponents * seccomponent = [[NSCalendar currentCalendar]components : NSSecondCalendarUnit fromDate:[NSDate date]toDate:[_datepicker dateValue] options:0];
    NSInteger sec = [seccomponent second];
    
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
    
    
    NSLog(@"%ld day", days );
    NSLog(@"%ld hour", hour );
    NSLog(@"%ld min", min );
    NSLog(@"%ld sec", sec );
    
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
    
    NSString * future = [NSString stringWithFormat:@"%ld Hrs", hour];
    [_timerhour setStringValue:future];
    NSString * future2 = [NSString stringWithFormat:@"%@ Mins", minutepadding];
    [_timermin setStringValue:future2];
    NSString * future3 = [NSString stringWithFormat:@"%@ Secs", secondpadding];
    [_timersec setStringValue:future3];
    
}





-(IBAction)clearCount:(id)sender {
    
    [counttime invalidate];
    
    NSString * daystring = [NSString stringWithFormat:@"DD"];
    [_timerday setStringValue:daystring];

    NSString * hour = [NSString stringWithFormat:@"HH"];
    [_timerhour setStringValue:hour];
    
    NSString * min = [NSString stringWithFormat:@"MM"];
    [_timermin setStringValue:min];
    
    NSString * sec = [NSString stringWithFormat:@"SS"];
    [_timersec setStringValue:sec];
    
    
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

-(NSInteger)currentDay {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents * components = [calendar components:NSDayCalendarUnit fromDate:now];
    
    return [components day];
    
}


@end
