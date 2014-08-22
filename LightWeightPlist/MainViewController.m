//
//  MainViewController.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

#import "LightWeightPlist.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - ibaction

- (IBAction)demoAction:(id)sender
{
    switch (arc4random()%4) {
        case 0:
            [self arrayDemo];
            break;
        case 1:
            [self dictionaryDemo];
            break;
        case 2:
            [self moreFriendlyScenario];
            break;
        case 3:
            [self buildInPlist];
            break;
        default:
            break;
    }
}

#pragma mark - demo

- (void)arrayDemo
{
    NSLog(@"========== array demo ==========");
    //create a array plist in document folder, and add some objects
    for (int i=0; i<10; i++) {
        [LWPArray(@"Daidouji") addObject:@(arc4random()%100)];
    }
    
    //forcewrite means you want to write data into disk immediately
    LWPForceWrite();
    
    //use LWPArray like NSMutableArray
    NSLog(@"%@", [LWPArray(@"Daidouji") firstObject]);
    NSLog(@"%@", [LWPArray(@"Daidouji") lastObject]);
    [LWPArray(@"Daidouji") removeObjectAtIndex:arc4random()%[LWPArray(@"Daidouji") count]];
    NSLog(@"%@", LWPArray(@"Daidouji"));
    
    //remove the plist
    LWPDelete(@"Daidouji");
    NSLog(@"========== array demo ==========");
}

- (void)dictionaryDemo
{
    NSLog(@"========== dictionary demo ==========");
    //create a dictionary plist in document folder, and add some objects
    for (int i=0; i<10; i++) {
        [LWPDictionary(@"Daidouji") setObject:@(arc4random()%100) forKey:[NSString stringWithFormat:@"%d", arc4random()%100]];
    }
    
    //if you do not want to write immediately, LightWeightPlist will help you to store those data on Press Home Button or receive memory warning
    //LWPForceWrite();
    
    //use LWPDictionary like NSMutableDictionary
    NSLog(@"%@", [LWPDictionary(@"Daidouji") allKeys]);
    NSLog(@"%@", [LWPDictionary(@"Daidouji") allValues]);
    [LWPDictionary(@"Daidouji") removeObjectForKey:[[LWPDictionary(@"Daidouji") allKeys] objectAtIndex:0]];
    NSLog(@"%@", LWPDictionary(@"Daidouji"));
    
    //LWPDelete erase the data both in memory and disk
    LWPDelete(@"Daidouji");
    NSLog(@"========== dictionary demo ==========");
}

- (void)moreFriendlyScenario
{
#define myArray LWPArray(@"Daidouji")
    
    //like array demo, but more friendly
    NSLog(@"========== friendly array demo ==========");
    
    for (int i=0; i<10; i++) {
        [myArray addObject:@(arc4random()%100)];
    }
    
    myArray[0] = @(23.12345);
    NSLog(@"%@", [myArray firstObject]);
    NSLog(@"%@", myArray[5]);
    [myArray removeObjectAtIndex:arc4random()%[myArray count]];
    NSLog(@"%@", myArray);
    
    LWPDelete(@"Daidouji");
    NSLog(@"========== friendly array demo ==========");
}

- (void)buildInPlist
{
    NSLog(@"========== resource demo ==========");
    //read plist in resource folder
    NSLog(@"%@, %@", LWPArray(@"PlistArray"), LWPDictionary(@"PlistDictionary"));
    
    //you also can add objects
    [LWPArray(@"PlistArray") addObjectsFromArray:@[@"hello", @"ok", @"bye"]];
    
    //than write to document folder
    LWPForceWrite();
    
    NSLog(@"%@", LWPArray(@"PlistArray"));
    
    //remove it
    LWPDelete(@"PlistArray");
    LWPDelete(@"PlistDictionary");
    NSLog(@"========== resource demo ==========");
}

@end
