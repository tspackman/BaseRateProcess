//
//  PrefController.m
//  Base Rate
//
//  Created by Tracy Spackman on 6/30/14.
//  Copyright (c) 2014 Tracy Spackman. All rights reserved.
//

#import "PrefController.h"

@interface PrefController ()

@end

@implementation PrefController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    [appDefault1 setStringValue:DeviceType1];
    [appDefault2 setStringValue:DeviceType2];
    [appDefault3 setStringValue:DeviceType3];
    [appDefault4 setStringValue:DeviceType4];
    [appDefault5 setStringValue:DeviceType5];
    [appDefault6 setStringValue:DeviceType6];
    [appDefault7 setStringValue:DeviceType7];
    [appDefault8 setStringValue:DeviceType8];
    [appDefault9 setStringValue:DeviceType9];
    [appDefault10 setStringValue:DeviceType10];
    [appDefault11 setStringValue:DeviceType11];
    [appDefault12 setStringValue:DeviceType12];
    [appDefault13 setStringValue:DeviceType13];
    [appDefault14 setStringValue:DeviceType14];
    [appDefault15 setStringValue:DeviceType15];
    [appDefault16 setStringValue:DeviceType16];

}

-(IBAction)UpdateUserDefaults:(id)sender{
/* Reads the values in the Preferences window and updates each of the defaults.
      these are written to the plist when the application is closed via menu.   */
    DeviceType1 = appDefault1.stringValue;
    DeviceType2 = appDefault2.stringValue;
    DeviceType3 = appDefault3.stringValue;
    DeviceType4 = appDefault4.stringValue;
    DeviceType5 = appDefault5.stringValue;
    DeviceType6 = appDefault6.stringValue;
    DeviceType7 = appDefault7.stringValue;
    DeviceType8 = appDefault8.stringValue;
    DeviceType9 = appDefault9.stringValue;
    DeviceType10 = appDefault10.stringValue;
    DeviceType11 = appDefault11.stringValue;
    DeviceType12 = appDefault12.stringValue;
    DeviceType13 = appDefault13.stringValue;
    DeviceType14 = appDefault14.stringValue;
    DeviceType15 = appDefault15.stringValue;
    DeviceType16 = appDefault16.stringValue;

    [self close];
}





@end
