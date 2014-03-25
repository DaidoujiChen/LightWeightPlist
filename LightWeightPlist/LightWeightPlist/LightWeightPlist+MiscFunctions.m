//
//  LightWeightPlist+MiscFunctions.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+MiscFunctions.h"

@implementation LightWeightPlist (MiscFunctions)
NSString* objectAddressString(NSObject* object) {
    return [NSString stringWithFormat:@"%p", object];
}
@end
