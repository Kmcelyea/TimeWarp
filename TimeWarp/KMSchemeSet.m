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
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
   

    
}
-(IBAction)SetSkyMix:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Cyan"];
    [[KMConfiguration instance]setTc:@"Cyan"];
    [[KMConfiguration instance]setFc:@"Cyan"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetGreenMeadow:(id)sender{
    [[KMConfiguration instance]setLc:@"Green"];
    [[KMConfiguration instance]setSc:@"Green"];
    [[KMConfiguration instance]setTc:@"Green"];
    [[KMConfiguration instance]setFc:@"Green"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
}
-(IBAction)SetOrangeDreamsicle:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Orange"];
    [[KMConfiguration instance]setTc:@"Orange"];
    [[KMConfiguration instance]setFc:@"Orange"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetMagenta:(id)sender {
    [[KMConfiguration instance]setLc:@"Magenta"];
    [[KMConfiguration instance]setSc:@"Magenta"];
    [[KMConfiguration instance]setTc:@"Magenta"];
    [[KMConfiguration instance]setFc:@"Magenta"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
    
    
}

-(IBAction)SetBanana:(id)sender {
    [[KMConfiguration instance]setLc:@"Banana"];
    [[KMConfiguration instance]setSc:@"Banana"];
    [[KMConfiguration instance]setTc:@"Banana"];
    [[KMConfiguration instance]setFc:@"Banana"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
    
    
}

-(IBAction)SetMulti:(id)sender {
    [[KMConfiguration instance]setLc:@"Green"];
    [[KMConfiguration instance]setSc:@"Magenta"];
    [[KMConfiguration instance]setTc:@"Cyan"];
    [[KMConfiguration instance]setFc:@"Orange"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]saveSettings];
    
}




-(IBAction)InvertBackground:(id)sender{
    NSString * currentset = [[KMConfiguration instance]bg];
    if ([currentset isEqualToString:@"Black"]) {
        [[KMConfiguration instance]setBg:@"White"];
            [[KMConfiguration instance]saveSettings];
    }
    else if ([currentset isEqualToString:@"White"]) {
        [[KMConfiguration instance]setBg:@"Black"];
            [[KMConfiguration instance]saveSettings];
            
    }

}

@end
