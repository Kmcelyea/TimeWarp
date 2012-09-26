//
//  KMSchemeSet.m
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/26/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import "KMSchemeSet.h"
#import "KMTimeView.h"

@implementation KMSchemeSet


-(IBAction)SetWhite:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"White"];
    [[KMConfiguration instance]setTc:@"White"];
    [[KMConfiguration instance]setFc:@"White"];
    [[KMConfiguration instance]saveSettings];

    
}
-(IBAction)SetSkyMix:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Cyan"];
    [[KMConfiguration instance]setTc:@"Cyan"];
    [[KMConfiguration instance]setFc:@"Cyan"];
    [[KMConfiguration instance]saveSettings];

}

-(IBAction)SetGreenMeadow:(id)sender{
    [[KMConfiguration instance]setLc:@"Green"];
    [[KMConfiguration instance]setSc:@"Green"];
    [[KMConfiguration instance]setTc:@"Green"];
    [[KMConfiguration instance]setFc:@"Green"];
    [[KMConfiguration instance]saveSettings];

}
-(IBAction)SetOrangeDreamsicle:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Orange"];
    [[KMConfiguration instance]setTc:@"Orange"];
    [[KMConfiguration instance]setFc:@"Orange"];
    [[KMConfiguration instance]saveSettings];

}
@end
