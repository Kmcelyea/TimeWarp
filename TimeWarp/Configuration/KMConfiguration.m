//
//  KMConfiguration.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/25/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMConfiguration.h"
#import "KMAppDelegate.h"

@implementation KMConfiguration
@synthesize localTimeColor = _localTimeColor;
@synthesize TimeColor2 = _TimeColor2;
@synthesize TimeColor3 = _TimeColor3;
@synthesize TimeColor4 = _TimeColor4;
@synthesize BgColor = _BgColor;
@synthesize lc = _lc;
@synthesize sc = _sc;
@synthesize tc = _tc;
@synthesize fc = _fc;
@synthesize bg = _bg;
@synthesize colorChange = _colorChange;

-(id) init{
    self = [super init];
    if(self)
    {

        userDefaultsValuesPath=[[NSBundle mainBundle] pathForResource:@"ColorScheme" ofType:@"plist"];
        userDefaultsValuesDict=[NSDictionary dictionaryWithContentsOfFile:userDefaultsValuesPath];
        [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsValuesDict];
        prefs = [NSUserDefaults standardUserDefaults];
        
        
        _lc = [prefs stringForKey:@"localColor"];
        _sc = [prefs stringForKey:@"secondTimeColor"];
        _tc = [prefs stringForKey:@"thirdTimeColor"];
        _fc = [prefs stringForKey:@"fourthTimeColor"];



    }
    return self;
}

+ (KMConfiguration *)instance {
    static KMConfiguration *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KMConfiguration alloc] init ];
    });
    
    return _instance;
}


-(NSColor *)localTimeColor {
    NSString *localTimeData=[prefs stringForKey:@"localColor"];
    if ([localTimeData isEqualToString:@"White"]) {
        return White;
    }
    
    if ([localTimeData isEqualToString:@"Cyan"])
    {
        return Cyan;
        
    }
    if ([localTimeData isEqualToString:@"Green"])
    {
        return Green;
        
    }
    if ([localTimeData isEqualToString:@"Orange"])
    {
        return Orange;
        
    }
    if ([localTimeData isEqualToString:@"Magenta"])
    {
        return Magenta;
        
    }
    if ([localTimeData isEqualToString:@"Banana"])
    {
        return Banana;
        
    }
    if ([localTimeData isEqualToString:@"Red"])
    {
        return Red;
        
    }
    if ([localTimeData isEqualToString:@"Black"])
    {
        return Black;
        
    }
    else return White;
}
-(NSColor *)TimeColor2 {
    NSString *colorData=[prefs stringForKey:@"secondTimeColor"];
    if ([colorData isEqualToString:@"White"]) {
        return White;
    }
    
    if ([colorData isEqualToString:@"Cyan"])
    {
        return Cyan;
        
    }
    if ([colorData isEqualToString:@"Green"])
    {
        return Green;
        
    }
    if ([colorData isEqualToString:@"Orange"])
    {
        return Orange;
        
    }
    if ([colorData isEqualToString:@"Magenta"])
    {
        return Magenta;
        
    }
    if ([colorData isEqualToString:@"Banana"])
    {
        return Banana;
        
    }
    if ([colorData isEqualToString:@"Red"])
    {
        return Red;
        
    }
    if ([colorData isEqualToString:@"Black"])
    {
        return Black;
        
    }
    else return Cyan;
}
-(NSColor *)TimeColor3 {
    NSString *colorData=[prefs stringForKey:@"thirdTimeColor"];
    if ([colorData isEqualToString:@"White"]) {
        return White;
    }
    
    if ([colorData isEqualToString:@"Cyan"])
    {
        return Cyan;
        
    }
    if ([colorData isEqualToString:@"Green"])
    {
        return Green;
        
    }
    if ([colorData isEqualToString:@"Orange"])
    {
        return Orange;
        
    }
    if ([colorData isEqualToString:@"Magenta"])
    {
        return Magenta;
        
    }
    if ([colorData isEqualToString:@"Banana"])
    {
        return Banana;
        
    }
    if ([colorData isEqualToString:@"Red"])
    {
        return Red;
        
    }
    if ([colorData isEqualToString:@"Black"])
    {
        return Black;
        
    }
    else return Cyan;
}
-(NSColor *)TimeColor4 {
    
    NSString *colorData=[prefs stringForKey:@"fourthTimeColor"];
    if ([colorData isEqualToString:@"White"]) {
        return White;
    }
    
    if ([colorData isEqualToString:@"Cyan"])
    {
        return Cyan;
        
    }
    if ([colorData isEqualToString:@"Green"])
    {
        return Green;
        
    }
    if ([colorData isEqualToString:@"Orange"])
    {
        return Orange;
        
    }
    if ([colorData isEqualToString:@"Magenta"])
    {
        return Magenta;
        
    }
    if ([colorData isEqualToString:@"Banana"])
    {
        return Banana;
        
    }
    if ([colorData isEqualToString:@"Red"])
    {
        return Red;
        
    }
    if ([colorData isEqualToString:@"Black"])
    {
        return Black;
        
    }
    else return Cyan;
}

-(NSColor *)BgColor {
    NSString *colorData=[prefs stringForKey:@"bgColor"];
    _bg = [prefs stringForKey:@"bgColor"];
    if ([colorData isEqualToString:@"White"]) {
        return Transwhite;
    }
    if ([colorData isEqualToString:@"Black"]) {
        return Transblack;
    }
    else return Transblack;
}

-(NSString *)colorChange{
    NSString * flag = [prefs stringForKey:@"changeflag"];
    _colorChange = flag;
    return flag;
}

#pragma mark -
#pragma mark Save Methods
-(void)saveSettings {
    NSLog(@"Save Action");
    prefs = [NSUserDefaults standardUserDefaults];
    
   
    [prefs removeObjectForKey:@"localColor"];
    [prefs setObject:_lc forKey:@"localColor"];
    
    
    [prefs removeObjectForKey:@"secondTimeColor"];
    [prefs setObject:_sc forKey:@"secondTimeColor"];

    
    [prefs removeObjectForKey:@"thirdTimeColor"];
    [prefs setObject:_tc forKey:@"thirdTimeColor"];

    
    [prefs removeObjectForKey:@"fourthTimeColor"];
    [prefs setObject:_fc forKey:@"fourthTimeColor"];

    [prefs removeObjectForKey:@"changeflag"];
    [prefs setObject:_colorChange forKey:@"changeflag"];
    
    [prefs removeObjectForKey:@"changeflagslide"];
    [prefs setObject:_colorChangeSlide forKey:@"changeflagslide"];
    
    [prefs removeObjectForKey:@"bgColor"];
    [prefs setObject:_bg forKey:@"bgColor"];
    
    [prefs synchronize];
    
}



#pragma mark -
#pragma mark Position Methods

-(NSRect)positionRect {
    NSString *positiondata = [prefs stringForKey:@"position"];
    if([positiondata isEqualToString:@"BottomLeft"]){
        return BottomLeft;
        
    }
    if([positiondata isEqualToString:@"BottomRight"]){
        return BottomRight;
        
    }
    if([positiondata isEqualToString:@"TopLeft"]){
        return TopLeft;
        
    }
    if([positiondata isEqualToString:@"TopRight"]){
        return TopRight;
        
    }
    else return BottomLeft;
}

-(NSRect)positionRectTicker {
    NSString *positiondata = [prefs stringForKey:@"position"];
    if([positiondata isEqualToString:@"BottomLeft"]){
        return BottomLeftTicker;
        
    }
    if([positiondata isEqualToString:@"BottomRight"]){
        return BottomRightTicker;
        
    }
    if([positiondata isEqualToString:@"TopLeft"]){
        return TopLeftTicker;
        
    }
    if([positiondata isEqualToString:@"TopRight"]){
        return TopRightTicker;
        
    }
    else return BottomLeftTicker;
}

-(NSRect)positionRectBarClock {
    NSString *positiondata = [prefs stringForKey:@"position"];
    if([positiondata isEqualToString:@"BottomLeft"]){
        return BottomLeftBarClock;
        
    }
    if([positiondata isEqualToString:@"BottomRight"]){
        return BottomRightBarClock;
        
    }
    if([positiondata isEqualToString:@"TopLeft"]){
        return TopLeftBarClock;
        
    }
    if([positiondata isEqualToString:@"TopRight"]){
        return TopRightBarClock;
        
    }
    else return BottomLeftBarClock;
}

-(NSRect)positionRectSlide {
    NSString *positiondata = [prefs stringForKey:@"position"];
    if([positiondata isEqualToString:@"BottomLeft"]){
        return BottomLeftSlide;
        
    }
    if([positiondata isEqualToString:@"BottomRight"]){
        return BottomRightSlide;
        
    }
    if([positiondata isEqualToString:@"TopLeft"]){
        return TopLeftSlide;
        
    }
    if([positiondata isEqualToString:@"TopRight"]){
        return TopRightSlide;
        
    }
    else return BottomLeftSlide;
}

-(void)savePosition {
    prefs = [NSUserDefaults standardUserDefaults];
    [prefs removeObjectForKey:@"position"];
    [prefs setObject:_position forKey:@"position"];
    
    [prefs synchronize];
}

@end
