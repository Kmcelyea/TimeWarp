//
//  KMTickerViewController.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMTickerViewController : NSViewController

@property(nonatomic)NSTimer *tickerTimer;
@property(nonatomic, assign)IBOutlet NSLevelIndicator *ticker;
@property(nonatomic, assign)double holdprogress;
@property(nonatomic, assign)IBOutlet NSTextField *amount;
@property(nonatomic, assign)IBOutlet NSTextField *titleamount;

-(void)updateProgress:(NSTimer *)timer;

@end
