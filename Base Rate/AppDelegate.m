//
//  AppDelegate.m
//  Base Rate
//
//  Created by Tracy Spackman on 8/24/13.
//  Copyright (c) 2013 Tracy Spackman. All rights reserved.
//

#import "AppDelegate.h"
#import "PrefController.h"


@implementation AppDelegate

+(void)initialize {
    // Call the Class PrefController to set the User Defaults
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *lastPath = [[NSUserDefaults standardUserDefaults] stringForKey:@"NSNavLastRootDirectory"];
    NSString *startingPath = [lastPath stringByStandardizingPath];

    
    filemgr = [NSFileManager defaultManager];
    currentPath = [filemgr currentDirectoryPath];
    
    if ([filemgr changeCurrentDirectoryPath:startingPath] == NO)
        NSLog(@"DIDn't work....\n");
    currentPath = [filemgr currentDirectoryPath];
    NSLog(@"Current path: %@\n",currentPath);
    [textViewStatus setString:@"Ready!"];

    
 /* Reads in the standard user defaults set for the app in the plist  */
        DeviceType1 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-1"];
        DeviceType2 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-2"];
        DeviceType3 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-3"];
        DeviceType4 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-4"];
        DeviceType5 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-5"];
        DeviceType6 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-6"];
        DeviceType7 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-7"];
        DeviceType8 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-8"];
        DeviceType9 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-9"];
        DeviceType10 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-10"];
        DeviceType11 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-11"];
        DeviceType12 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-12"];
        DeviceType13 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-13"];
        DeviceType14 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-14"];
        DeviceType15 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-15"];
        DeviceType16 =[[NSUserDefaults standardUserDefaults] stringForKey:@"Default-16"];
    
  
}

-(void)applicationWillTerminate:(NSNotification *)notification {
    // Updates the values of the standard user defaults in the plist.
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType1 forKey:kdefault1];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType2 forKey:kdefault2];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType3 forKey:kdefault3];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType4 forKey:kdefault4];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType5 forKey:kdefault5];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType6 forKey:kdefault6];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType7 forKey:kdefault7];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType8 forKey:kdefault8];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType9 forKey:kdefault9];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType10 forKey:kdefault10];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType11 forKey:kdefault11];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType12 forKey:kdefault12];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType13 forKey:kdefault13];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType14 forKey:kdefault14];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType15 forKey:kdefault15];
    [[NSUserDefaults standardUserDefaults] setObject:DeviceType16 forKey:kdefault16];

}


/* This action is used to display the Preferences window */
-(IBAction)showPrefController:(id)sender
{
    if (!prefController) {
        prefController = [[PrefController alloc] initWithWindowNibName:@"PreferenceMenu"];
    }
    [prefController showWindow:self];

}


-(IBAction)ChangeDirectory:(id)sender
{
    int i; // Loop counter
    
    //Create the File Open Dialog class
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    //Enable the selection of files in the dialog
    [openDlg setCanChooseFiles:YES];
    
    // Multiple files not allowed
    [openDlg setAllowsMultipleSelection:NO];
    
    //Enable the selection of directorys in the dialog
    [openDlg setCanChooseDirectories:NO];
    
    //Display the dialog. If the OK button is pressed,
    // Process the file.
//    if ( [openDlg runModal] == NSOKButton )
    if ( [openDlg runModalForDirectory:nil file:nil] == NSOKButton)
    {
    //Get an array containing the full filenames of all files and directorys selected
//        NSArray* files = [openDlg URLs];
        NSArray* files = [openDlg filenames];

        
    //loop thru all the files and process them
        for(i = 0; i < [files count]; i++)
        {
            NSString* fileName = [files objectAtIndex:i];
            workingFile = fileName;

    // Updates the dialog box lable with file name
            [label setStringValue:fileName];
            NSLog(@"The File is: %@\n",fileName);
            
            NSString *comment,*result;
            comment = @"The file being processed is:\n   ";
            
            result = comment;
            result = [result stringByAppendingString:fileName];
            [textViewStatus setString:result];
        }
    }
}



-(IBAction)readFile:(id)sender
{
/* Creates the output file in the same directory as the input file */
    [[NSFileManager defaultManager] createFileAtPath:@"BaseRateFile.csv" contents:nil attributes:nil];
    outfile1 = [NSFileHandle fileHandleForWritingAtPath:@"BaseRateFile.csv"];
    
/* Declare the Object Methods */
    CSsip *cssip = [[CSsip alloc] init];
    Umb *umb = [[Umb alloc] init];
    Ufp *ufp = [[Ufp alloc]init];
    
/* Opens the file exported from the OSV for reading */
    infile1 = [NSFileHandle fileHandleForReadingAtPath:workingFile];
    if (infile1 == nil) {
        NSLog(@"Open input file failed.\n");
    return;
    }
    
    
/* Reads the contents of the file into the data buffer */
    buffer =[infile1 readDataToEndOfFile];
    
/* Allocates the contents of the data buffer to an NSString */
    int lp = 0, done=0;
    int s1 = 0;
    NSString *sort = @"None", *CS_SIP=@"CS_",*CS=@"CS\n",*UMB=@"UMB",*UFP=@"UFP",*sortend =@"#IN";
    NSString *cFld1=NULL, *cFld3=NULL,*cFld4=NULL, *cFld27=NULL, *cFld40=NULL;// *cFld41=NULL;
    NSString *uFld1=NULL, *uFld2=NULL, *uFld5=NULL, *dictcssip;
    NSString *ufp1=NULL,*ufp3=NULL;

    
/* Reads the entire file into rawFile in a string format for further processing. */
    rawFile = [[NSString alloc] initWithData:buffer encoding:NSASCIIStringEncoding];
    
/* Create an array rawRec from the records in rawFile. */
    NSArray *rawRec =[rawFile componentsSeparatedByString:@";;"];
    
/* Create a Dictionary to collect the station info from 2 sections of the soapExport */
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *dictBR = [[NSMutableDictionary alloc]init];
    
/*Start the while loop. */
    while (done != 1) {

/* Put each record into a seperate string */
    NSString *stnstring = [rawRec objectAtIndex:s1];
    
/* Read each string into an array for further parsing */
    NSArray *stnrec =[stnstring componentsSeparatedByString:@","];
        sort =[[stnrec[0] substringFromIndex:1] substringToIndex:3];

        if ([sort isEqualToString:CS_SIP]) {
            cFld1 =[stnrec objectAtIndex:1];
            cFld3 =[stnrec objectAtIndex:3];
            cFld4 =[stnrec objectAtIndex:4];
            cFld40 =[stnrec objectAtIndex:14];
            cFld27 =[stnrec objectAtIndex:27];
            
/* Setting up the 1st write to the NSMutableDictionary based on CS_SIP record */
            NSString *subscriberNumber =[[cFld1 substringFromIndex:14]substringToIndex:11];
            NSString *billingNum = [[cFld4 substringFromIndex:11]substringToIndex:11];
            [cssip Subscr:cFld1 Account:cFld3 BillID:cFld4 Dept:cFld27 ExtCallerID:cFld40];
            dictcssip = [NSString stringWithFormat:@"%@,%@",billingNum,cssiprecord];  //BillingID - AccountID - DepartmentName
            [dict setValue:dictcssip forKey:subscriberNumber];
        }
        
        else if ([sort isEqualToString:CS]){
            cFld1 =[stnrec objectAtIndex:1];
            cFld3 =[stnrec objectAtIndex:3];
            cFld4 =[stnrec objectAtIndex:4];
            cFld27 = [stnrec objectAtIndex:27];
            cFld40 = [stnrec objectAtIndex:14];
            
            
/* Setting up the 1st write to the NSMutableDictionary based on CS record */
            NSString *subscriberNumber =[[cFld1 substringFromIndex:14]substringToIndex:11];
            NSString *billingNum = [[cFld4 substringFromIndex:11]substringToIndex:11];
            [cssip Subscr:cFld1 Account:cFld3 BillID:cFld4 Dept:cFld27 ExtCallerID:cFld40];
            dictcssip = [NSString stringWithFormat:@"%@,%@",billingNum,cssiprecord];  //BillingID - AccountID - DepartmentName
            [dict setValue:dictcssip forKey:subscriberNumber];
        }
        
        else if ([sort isEqualToString:UMB]){
            uFld1 =[stnrec objectAtIndex:1];
            uFld2 =[stnrec objectAtIndex:2];
            uFld5 =[stnrec objectAtIndex:5];
            NSString *subScrib =[[uFld1 substringFromIndex:14]substringToIndex:11];
            NSString *currentRead1 = [dict objectForKey:subScrib];
            [umb Subscr:uFld1 Name:uFld2 Exten:uFld5];
            NSString *merge1 =[NSString stringWithFormat:@"%@,%@",currentRead1,umbrecord];
            [dict setValue:merge1 forKey:subScrib];
        }
        
/* If a UFP record exists for a device the info is pulled from the 1st dictionary, the new info added and written to the 2nd dictionary. */
        else if ([sort isEqualToString:UFP]){
            ufp1 = [stnrec objectAtIndex:1];
            ufp3 = [stnrec objectAtIndex:3];
            
            NSString *subScribUFP =[[ufp1 substringFromIndex:14]substringToIndex:11];
            NSString *currentRead2 = [dict objectForKey:subScribUFP];

            [ufp Profile:ufp3];
            NSString *merge2 = [NSString stringWithFormat:@"%@,%@;;\n",currentRead2,profrecord];
            [dictBR setValue:merge2 forKey:subScribUFP];
        }
        
        else if ([sort isEqualToString:sortend]) {
            done =1;
        }

        else { }

        lp++; // use until proper last record event is identified
        s1++; // used to increment the rawRec array
    }
 
/*  The NSArray below simply pulls all the values for all the keys and writes them to the file */
    NSArray * values =[dictBR allValues];
    for (id value in values) {

        NSArray *rawDevice =[value componentsSeparatedByString:@";;"];
        NSString *endDevice = [rawDevice objectAtIndex:0];
        
        NSArray *endPoint =[endDevice componentsSeparatedByString:@","];
        NSString *testPoint = [endPoint objectAtIndex:5];

        
        if ([testPoint isEqualToString:@"Non-record"]) {
            
        }
        
        else{
        [outfile1 writeData:[value dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
 
    return;
    [infile1 closeFile];
    [outfile1 closeFile];
}


@end
