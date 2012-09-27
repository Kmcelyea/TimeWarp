//
//  KMConvertHud.h
//  TimeWarp
//
//  Created by Kyle J. McElyea on 9/27/12.
//  Copyright (c) 2012 Kyle J. McElyea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMConvertHud : NSObject



@property (assign) IBOutlet NSWindow *converthud;



-(IBAction)showHud:(id)sender;
-(IBAction)hideHud:(id)sender;

@end
