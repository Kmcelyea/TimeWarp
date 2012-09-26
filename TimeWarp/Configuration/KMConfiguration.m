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
@synthesize lc = _lc;
@synthesize sc = _sc;
@synthesize tc = _tc;
@synthesize fc = _fc;

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
    else return Cyan;
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

    
    [prefs synchronize];
    
}


@end
