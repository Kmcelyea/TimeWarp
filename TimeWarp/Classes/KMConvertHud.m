//
//  KMConvertHud.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/27/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMConvertHud.h"

@implementation KMConvertHud


-(IBAction)showHud:(id)sender {
    [_converthud setOpaque:NO];
    [_converthud setBackgroundColor:Transblack];
    [_converthud makeKeyAndOrderFront:self];
    
}

-(IBAction)hideHud:(id)sender {
    [_converthud orderOut:self];
    
}
@end
