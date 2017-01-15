//
//  PrefController.h
//  Base Rate
//
//  Created by Tracy Spackman on 6/30/14.
//  Copyright (c) 2014 Tracy Spackman. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CSsip.h"


#define kdefault1 @"Default-1"
#define kdefault2 @"Default-2"
#define kdefault3 @"Default-3"
#define kdefault4 @"Default-4"
#define kdefault5 @"Default-5"
#define kdefault6 @"Default-6"
#define kdefault7 @"Default-7"
#define kdefault8 @"Default-8"
#define kdefault9 @"Default-9"
#define kdefault10 @"Default-10"
#define kdefault11 @"Default-11"
#define kdefault12 @"Default-12"
#define kdefault13 @"Default-13"
#define kdefault14 @"Default-14"
#define kdefault15 @"Default-15"
#define kdefault16 @"Default-16"



@interface PrefController : NSWindowController {
    IBOutlet NSTextField *appDefault1;
    IBOutlet NSTextField *appDefault2;
    IBOutlet NSTextField *appDefault3;
    IBOutlet NSTextField *appDefault4;
    IBOutlet NSTextField *appDefault5;
    IBOutlet NSTextField *appDefault6;
    IBOutlet NSTextField *appDefault7;
    IBOutlet NSTextField *appDefault8;
    IBOutlet NSTextField *appDefault9;
    IBOutlet NSTextField *appDefault10;
    IBOutlet NSTextField *appDefault11;
    IBOutlet NSTextField *appDefault12;
    IBOutlet NSTextField *appDefault13;
    IBOutlet NSTextField *appDefault14;
    IBOutlet NSTextField *appDefault15;
    IBOutlet NSTextField *appDefault16;
    
    
    
}

-(IBAction)UpdateUserDefaults:(id)sender;


@end
