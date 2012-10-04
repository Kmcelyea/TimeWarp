//
//  GlobalHeader.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/20/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#ifndef TimeWarp_GlobalHeader_h
#define TimeWarp_GlobalHeader_h

#pragma mark -
#pragma mark Background Colors
#define Transblack [NSColor colorWithCalibratedRed:0.0f green:0.0f blue:0.0f alpha:0.65f]
#define Transwhite [NSColor colorWithCalibratedRed:1.0f green:1.0f blue:1.0f alpha:0.8f]

#pragma mark -
#pragma mark Outlet Colors
#define White [NSColor colorWithCalibratedRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]
#define Black [NSColor colorWithCalibratedRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]
#define Cyan [NSColor colorWithCalibratedRed:102/255.0 green:255/255.0 blue:204/255.0 alpha:1.0]
#define Orange [NSColor colorWithCalibratedRed:255/255.0 green:204/255.0 blue:102/255.0 alpha:1.0]
#define Green [NSColor colorWithCalibratedRed:0/255.0 green:255/255.0 blue:0/255.0 alpha:1.0]
#define Magenta [NSColor colorWithCalibratedRed:255/255.0 green:0/255.0 blue:255/255.0 alpha:1.0]
#define Banana [NSColor colorWithCalibratedRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1.0]
#define Red [NSColor colorWithCalibratedRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]


#pragma mark -
#pragma mark Rects

#define BottomLeft NSMakeRect(0, 0, 336, 217)
#define BottomLeftSlide NSMakeRect(336, 0, 390, 217)
#define TopLeft NSMakeRect(0, 661, 336, 217)
#define TopLeftSlide NSMakeRect(336, 661, 390, 217)

#define BottomRight NSMakeRect(1114, 0, 336, 217)
#define BottomRightSlide NSMakeRect(724, 0, 390, 217)
#define TopRight NSMakeRect(1114, 661, 336, 217)
#define TopRightSlide NSMakeRect(724, 661, 390, 217)


#define BottomLeftTicker NSMakeRect(0,217,336,41)
#define TopLeftTicker NSMakeRect(0,620,336,41)
#define BottomRightTicker NSMakeRect(1114,217,326,41)
#define TopRightTicker NSMakeRect(1114,620,336,41)

#define BottomLeftBarClock NSMakeRect(0,258,336,79)
#define TopLeftBarClock NSMakeRect(0,541,336,79)
#define BottomRightBarClock NSMakeRect(1114,258,336,79)
#define TopRightBarClock NSMakeRect(1114,541,336,79)
#endif
