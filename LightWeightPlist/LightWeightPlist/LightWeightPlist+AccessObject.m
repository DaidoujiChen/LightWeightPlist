//
//  LightWeightPlist+AccessObject.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+AccessObject.h"

@implementation LightWeightPlist (AccessObject)

static const char OBJECTSPOINTER;

LightWeightPlistObjects* objects() {
    
    static id self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self = [LightWeightPlist class];
        LightWeightPlistObjects* objects = [LightWeightPlistObjects new];
        [objects.dataCache setDelegate:(id<NSCacheDelegate>)self];
        objc_setAssociatedObject(self, &OBJECTSPOINTER, objects, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    return objc_getAssociatedObject(self, &OBJECTSPOINTER);
    
}

@end
