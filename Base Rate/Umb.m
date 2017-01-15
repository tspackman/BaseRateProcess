//
//  Umb.m
//  Base Rate
//
//  Created by Tracy Spackman on 6/28/14.
//  Copyright (c) 2014 Tracy Spackman. All rights reserved.
//

#import "Umb.h"

@implementation Umb

-(NSString*)Subscr:uFld1 Name:uFld2 Exten:uFld5;
{
    SubscriberDN =[[uFld1 substringFromIndex:0] substringToIndex:20];
    Nameltr =[uFld2 length];
    Extltr = [uFld5 length];
    
/*  Determines if a Name exists and reads any length entry */
    if (Nameltr > 15) {
        Namelgt = (Nameltr -16);
        ExtName =[[uFld2 substringFromIndex:12] substringToIndex:Namelgt];
        }
    else{ }
    
/* Determines if a BGEXTENSION exists and reads any length entry */
    if (Extltr > 16) {
        Extlgt = (Extltr - 17);
        ExtNumber=[[uFld5 substringFromIndex:13] substringToIndex:Extlgt];}
    else{ExtNumber = @"No Ext";
    }


    umbrecord = [NSString stringWithFormat:@"%@,%@",ExtName,ExtNumber];
    return umbrecord;

    
}

@end
