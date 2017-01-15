//
//  Ufp.m
//  Base Rate
//
//  Created by Tracy Spackman on 4/8/16.
//  Copyright © 2016 Tracy Spackman. All rights reserved.
//

#import "Ufp.h"

@implementation Ufp

-(NSString*)Profile:ufp3;
{
    FeatProfltrs = [ufp3 length];
    
    
    //  Determines the feature profile name
    if (FeatProfltrs > 9) {
        FeatProfLgt = (FeatProfltrs - 11);
        featureprofile =[[ufp3 substringFromIndex:8] substringToIndex:(FeatProfLgt - 1)];}
    else{featureprofile = @"Other";
    }
    
    profrecord = featureprofile;
    
    if ([featureprofile isEqualToString:DeviceType1]) {
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType2]) {
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType3]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType4]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType5]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType6]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType7]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType8]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType9]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType10]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType11]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType12]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType13]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType14]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType15]){
        return profrecord;}
    else if ([featureprofile isEqualToString:DeviceType16]){
        return profrecord;}
    
    else {profrecord =@"Non-record";
        return profrecord;
    }
}

@end












