//
//  KMPositionSet.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/27/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMPositionSet.h"

@implementation KMPositionSet


-(IBAction)SetBottomLeft:(id)sender{
    
    [[KMConfiguration instance]setPosition:@"BottomLeft"];
    [[KMConfiguration instance]savePosition];
    NSAlert * non = [NSAlert alertWithMessageText:@"Change will take effect on next launch" defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [non runModal];

}

-(IBAction)SetBottomRight:(id)sender{
    [[KMConfiguration instance]setPosition:@"BottomRight"];
    [[KMConfiguration instance]savePosition];
    NSAlert * non = [NSAlert alertWithMessageText:@"Change will take effect on next launch" defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [non runModal];

}

-(IBAction)SetTopLeft:(id)sender{
    [[KMConfiguration instance]setPosition:@"TopLeft"];
    [[KMConfiguration instance]savePosition];
    NSAlert * non = [NSAlert alertWithMessageText:@"Change will take effect on next launch" defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [non runModal];

    
}

-(IBAction)SetTopRight:(id)sender{
    [[KMConfiguration instance]setPosition:@"TopRight"];
    [[KMConfiguration instance]savePosition];
    NSAlert * non = [NSAlert alertWithMessageText:@"Change will take effect on next launch" defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
    [non runModal];

}


@end
