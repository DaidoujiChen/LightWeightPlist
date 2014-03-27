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

BOOL isArray(id object) {
    return (0 == strcmp(object_getClassName(object), "__NSArrayM") ||
            0 == strcmp(object_getClassName(object), "__NSCFArray"));
}

BOOL isDictionary(id object) {
    return (0 == strcmp(object_getClassName(object), "__NSDictionaryM") ||
            0 == strcmp(object_getClassName(object), "__NSCFDictionary"));
}

@end
