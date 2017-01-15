//
//  Ufp.h
//  Base Rate
//
//  Created by Tracy Spackman on 4/8/16.
//  Copyright © 2016 Tracy Spackman. All rights reserved.
//  This is where the feature_profile information was moved to in OSV 7

#import <Foundation/Foundation.h>


NSString *featureprofile;
NSString *profrecord;


NSString *DeviceType1,*DeviceType2,*DeviceType3,*DeviceType4,*DeviceType5,*DeviceType6,*DeviceType7,*DeviceType8,*DeviceType9,*DeviceType10;
NSString *DeviceType11,*DeviceType12,*DeviceType13,*DeviceType14,*DeviceType15,*DeviceType16;

long FeatProfltrs,FeatProfLgt;

@interface Ufp : NSObject

-(NSString*)Profile:ufp3;

@end
