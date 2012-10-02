//
//  KMConfiguration.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/25/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMConfiguration : NSObject
{
    NSString *userDefaultsValuesPath;
    NSDictionary *userDefaultsValuesDict;
    NSUserDefaults *prefs;
    
}
@property(nonatomic, strong)NSString * lc;
@property(nonatomic, strong)NSString * sc;
@property(nonatomic, strong)NSString * tc;
@property(nonatomic, strong)NSString * fc;
@property(nonatomic, strong)NSString * bg;

@property(nonatomic, strong)NSColor *localTimeColor;
@property(nonatomic, strong)NSColor *TimeColor2;
@property(nonatomic, strong)NSColor *TimeColor3;
@property(nonatomic, strong)NSColor *TimeColor4;

@property(nonatomic, strong)NSColor *BgColor;

@property(nonatomic, strong)NSString *colorChange;
@property(nonatomic, strong)NSString *colorChangeSlide;


//Position Config
@property (nonatomic, strong)NSString * position;
//@property(nonatomic, strong)NSString * Bottomleft;
//@property(nonatomic, strong)NSString * Bottomright;
//@property(nonatomic, strong)NSString * Topleft;
//@property(nonatomic, strong)NSString * Topright;

@property(nonatomic)NSRect positionRect;
@property(nonatomic)NSRect positionRectSlide;
@property(nonatomic)NSRect positionRectTicker;
//@property(nonatomic, strong)NSRect * RectBottomleft;
//@property(nonatomic, strong)NSRect * RectBottomright;
//@property(nonatomic, strong)NSRect * RectTopleft;
//@property(nonatomic, strong)NSRect * RectTopright;

+ (KMConfiguration *)instance;

-(void) saveSettings;
-(void) savePosition;
@end
