//
//  KMClock.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/1/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMClock : NSObject {
    
    NSString *timeValuesPath;
    NSDictionary *timeValuesDict;
}


@property(nonatomic,assign)NSString *secondpadding;
@property(nonatomic,assign)NSString *minutepadding;
@property(nonatomic,assign)NSString *theTime;
@property(nonatomic,strong)NSString *getTime;

@property(nonatomic,assign)NSString *theLocalTime;
@property(nonatomic,strong)NSString *getLocalTime;

@property(nonatomic,assign)NSString *theEDT;
@property(nonatomic,strong)NSString *getEDT;

@property(nonatomic,assign)NSString *theMDT;
@property(nonatomic,strong)NSString *getMDT;

@property(nonatomic,assign)NSString *thePDT;
@property(nonatomic,strong)NSString *getPDT;

@property(nonatomic,assign)NSString *theCDT;
@property(nonatomic,strong)NSString *getCDT;

@property(nonatomic,assign)NSInteger *currenthour;

@property(nonatomic,assign)double currentprogresshour;
+ (KMClock *)instance;

@end
