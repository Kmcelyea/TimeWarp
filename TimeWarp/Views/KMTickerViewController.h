//
//  KMTickerViewController.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 10/2/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KMTickerViewController : NSViewController

@property (nonatomic)NSTimer *tickerTimer;
@property(nonatomic, assign)IBOutlet NSLevelIndicator *ticker;

-(void)updateProgress:(NSTimer *)timer;

@end
