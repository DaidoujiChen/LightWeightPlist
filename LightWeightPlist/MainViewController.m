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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate *startDate = [NSDate date];
    
    for (int i=0; i<300000; i++) {
        [LWPArray(@"myTest") addObject:[NSNumber numberWithInt:arc4random()%10000]];
        
        if (i%10000 == 0) {
            [LWPArray(@"myTest") removeObjectAtIndex:arc4random()%[LWPArray(@"myTest") count]];
        }
    }

    NSLog(@"%f", [[NSDate date] timeIntervalSince1970] - [startDate timeIntervalSince1970]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
