//
//  CSsip.h
//  Base Rate
//
//  Created by Tracy Spackman on 6/28/14.
//  Copyright (c) 2014 Tracy Spackman. All rights reserved.
//  Information on individual sip endpoints.

#import <Foundation/Foundation.h>
#import "AppDelegate.h"


NSString *subscriber;
NSString *accountID;
NSString *billingID;
NSString *department;
NSString *extcallerID;

NSString *keysetuse;

NSString *cssiprecord;


NSString *newDev10;

NSMutableDictionary *dict;

long AccountNumLtrs,AccountNumLgt;
long DeptNumLtrs,DeptNmLgt;



@interface CSsip : NSObject

-(NSString*)Subscr:cFld1 Account:cFld3 BillID:cFld4 Dept:cFld27 ExtCallerID:cFld40;


@end
