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
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
   

    
}
-(IBAction)SetSkyMix:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Cyan"];
    [[KMConfiguration instance]setTc:@"Cyan"];
    [[KMConfiguration instance]setFc:@"Cyan"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetGreenMeadow:(id)sender{
    [[KMConfiguration instance]setLc:@"Green"];
    [[KMConfiguration instance]setSc:@"Green"];
    [[KMConfiguration instance]setTc:@"Green"];
    [[KMConfiguration instance]setFc:@"Green"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}
-(IBAction)SetOrangeDreamsicle:(id)sender{
    [[KMConfiguration instance]setLc:@"White"];
    [[KMConfiguration instance]setSc:@"Orange"];
    [[KMConfiguration instance]setTc:@"Orange"];
    [[KMConfiguration instance]setFc:@"Orange"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetMagenta:(id)sender {
    [[KMConfiguration instance]setLc:@"Magenta"];
    [[KMConfiguration instance]setSc:@"Magenta"];
    [[KMConfiguration instance]setTc:@"Magenta"];
    [[KMConfiguration instance]setFc:@"Magenta"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
    
    
}

-(IBAction)SetBanana:(id)sender {
    [[KMConfiguration instance]setLc:@"Banana"];
    [[KMConfiguration instance]setSc:@"Banana"];
    [[KMConfiguration instance]setTc:@"Banana"];
    [[KMConfiguration instance]setFc:@"Banana"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
    
    
}

-(IBAction)SetMulti:(id)sender {
    [[KMConfiguration instance]setLc:@"Green"];
    [[KMConfiguration instance]setSc:@"Magenta"];
    [[KMConfiguration instance]setTc:@"Cyan"];
    [[KMConfiguration instance]setFc:@"Orange"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
    
}

-(IBAction)SetRed:(id)sender {
    [[KMConfiguration instance]setLc:@"Red"];
    [[KMConfiguration instance]setSc:@"Red"];
    [[KMConfiguration instance]setTc:@"Red"];
    [[KMConfiguration instance]setFc:@"Red"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
    
    
}

-(IBAction)SetBlack:(id)sender{
    [[KMConfiguration instance]setLc:@"Black"];
    [[KMConfiguration instance]setSc:@"Black"];
    [[KMConfiguration instance]setTc:@"Black"];
    [[KMConfiguration instance]setFc:@"Black"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}


-(IBAction)SetOcean:(id)sender {
    [[KMConfiguration instance]setLc:@"Cyan"];
    [[KMConfiguration instance]setSc:@"Aqua"];
    [[KMConfiguration instance]setTc:@"Aqua"];
    [[KMConfiguration instance]setFc:@"Aqua"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetTang:(id)sender {
    [[KMConfiguration instance]setLc:@"Tang"];
    [[KMConfiguration instance]setSc:@"Tang"];
    [[KMConfiguration instance]setTc:@"Tang"];
    [[KMConfiguration instance]setFc:@"Tang"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
    
}

-(IBAction)SetGrape:(id)sender{
    [[KMConfiguration instance]setLc:@"Grape"];
    [[KMConfiguration instance]setSc:@"Grape"];
    [[KMConfiguration instance]setTc:@"Grape"];
    [[KMConfiguration instance]setFc:@"Grape"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetBlueberry:(id)sender{
    [[KMConfiguration instance]setLc:@"Blueberry"];
    [[KMConfiguration instance]setSc:@"Blueberry"];
    [[KMConfiguration instance]setTc:@"Blueberry"];
    [[KMConfiguration instance]setFc:@"Blueberry"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetLemon:(id)sender{
    [[KMConfiguration instance]setLc:@"Lemon"];
    [[KMConfiguration instance]setSc:@"Lemon"];
    [[KMConfiguration instance]setTc:@"Lemon"];
    [[KMConfiguration instance]setFc:@"Lemon"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetLime:(id)sender{
    [[KMConfiguration instance]setLc:@"Lime"];
    [[KMConfiguration instance]setSc:@"Lime"];
    [[KMConfiguration instance]setTc:@"Lime"];
    [[KMConfiguration instance]setFc:@"Lime"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetFern:(id)sender{
    [[KMConfiguration instance]setLc:@"Fern"];
    [[KMConfiguration instance]setSc:@"Fern"];
    [[KMConfiguration instance]setTc:@"Fern"];
    [[KMConfiguration instance]setFc:@"Fern"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetClover:(id)sender{
    [[KMConfiguration instance]setLc:@"Clover"];
    [[KMConfiguration instance]setSc:@"Clover"];
    [[KMConfiguration instance]setTc:@"Clover"];
    [[KMConfiguration instance]setFc:@"Clover"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
    [[KMConfiguration instance]saveSettings];
}

-(IBAction)SetStrawberry:(id)sender{
    [[KMConfiguration instance]setLc:@"Strawberry"];
    [[KMConfiguration instance]setSc:@"Strawberry"];
    [[KMConfiguration instance]setTc:@"Strawberry"];
    [[KMConfiguration instance]setFc:@"Strawberry"];
    [[KMConfiguration instance]setColorChange:@"1"];
    [[KMConfiguration instance]setColorChangeSlide:@"1"];
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
