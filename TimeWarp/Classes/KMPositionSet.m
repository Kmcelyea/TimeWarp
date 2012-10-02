//
//  KMPositionSet.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/27/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMPositionSet.h"

@implementation KMPositionSet


-(IBAction)SetBottomLeft:(id)sender
{
    
    [[KMConfiguration instance]setPosition:@"BottomLeft"];
    [[KMConfiguration instance]savePosition];
    [_window setFrame:[[KMConfiguration instance]positionRect] display:YES];
    [_windowslide setFrame:[[KMConfiguration instance]positionRectSlide] display:YES];
    [_windowticker setFrame:[[KMConfiguration instance]positionRectTicker] display:YES];
}

-(IBAction)SetBottomRight:(id)sender
{
    [[KMConfiguration instance]setPosition:@"BottomRight"];
    [[KMConfiguration instance]savePosition];
    [_window setFrame:[[KMConfiguration instance]positionRect] display:YES];
    [_windowslide setFrame:[[KMConfiguration instance]positionRectSlide] display:YES];
    [_windowticker setFrame:[[KMConfiguration instance]positionRectTicker] display:YES];
    
}

-(IBAction)SetTopLeft:(id)sender
{
    [[KMConfiguration instance]setPosition:@"TopLeft"];
    [[KMConfiguration instance]savePosition];
    [_window setFrame:[[KMConfiguration instance]positionRect] display:YES];
    [_windowslide setFrame:[[KMConfiguration instance]positionRectSlide] display:YES];
    [_windowticker setFrame:[[KMConfiguration instance]positionRectTicker] display:YES];
    
}

-(IBAction)SetTopRight:(id)sender
{
    [[KMConfiguration instance]setPosition:@"TopRight"];
    [[KMConfiguration instance]savePosition];
    [_window setFrame:[[KMConfiguration instance]positionRect] display:YES];
    [_windowslide setFrame:[[KMConfiguration instance]positionRectSlide] display:YES];
    [_windowticker setFrame:[[KMConfiguration instance]positionRectTicker] display:YES];
    
}


@end
