//
//  CSsip.m
//  Base Rate
//
//  Created by Tracy Spackman on 6/28/14.
//  Copyright (c) 2014 Tracy Spackman. All rights reserved.
//

#import "CSsip.h"

@implementation CSsip

-(NSString*)Subscr:cFld1 Account:cFld3 BillID:cFld4 Dept:cFld27 ExtCallerID:cFld40;
{
    AccountNumLtrs = [cFld3 length];
    DeptNumLtrs = [cFld27 length];
//    FeatProfltrs = [cFld41 length];
    
    subscriber=[[cFld1 substringFromIndex:14] substringToIndex:11];
    billingID =[[cFld4 substringFromIndex:11] substringToIndex:11];
    
/*  Determines if a Cost Center number exists and reads the number  */
    if (AccountNumLtrs > 14) {
        AccountNumLgt =(AccountNumLtrs -15);
        accountID =[[cFld3 substringFromIndex:11] substringToIndex:AccountNumLgt];}
    else{accountID =@"00000";
        }
    
/*  Reads the BGDEPT entry determines the length and gets a varible lenght name  */
    if (DeptNumLtrs > 15) {
        DeptNmLgt = (DeptNumLtrs - 16);
        department=[[cFld27 substringFromIndex:12] substringToIndex:DeptNmLgt];}
    else{department =@"No Dept";
    }
    
    cssiprecord = [NSString stringWithFormat:@"%@,%@",accountID,department];
    
    return 0;
}

@end
