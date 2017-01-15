//
//  AppDelegate.h
//  Base Rate
//
//  Created by Tracy Spackman on 8/24/13.
//  Copyright (c) 2013 Tracy Spackman. All rights reserved.
//
//  Setup of GitHub repository

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSFileManager.h>
#import "CSsip.h"
#import "Umb.h"
#import "Ufp.h"

@class PrefController;

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    PrefController *prefController;
    
    NSFileManager *filemgr;
    NSData *buffer;
    NSString *currentPath, *LastWorkingPath,*workingFile, *rawFile;
    NSFileHandle *infile1, *outfile1;


    
    IBOutlet NSTextField *label; //Updates the dialog box with file name to be used
    IBOutlet NSTextView *textViewStatus;
}

-(IBAction)showPrefController:(id)sender;

@property (assign) IBOutlet NSWindow *window;


@end
