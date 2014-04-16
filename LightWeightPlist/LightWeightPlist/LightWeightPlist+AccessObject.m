//
//  LightWeightPlist+AccessObject.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+AccessObject.h"

@implementation LightWeightPlist (AccessObject)

static const char DATACACHEPOINTER;
static const char POINTERMAPPINGPOINTER;
static const char FILEMANAGERPOINTER;

NSCache* dataCache() {
    
    static id self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self = [LightWeightPlist class];
        NSCache *dataCache = [[NSCache alloc] init];
        [dataCache setDelegate:(id<NSCacheDelegate>)self];
        objc_setAssociatedObject(self, &DATACACHEPOINTER, dataCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    
    return objc_getAssociatedObject(self, &DATACACHEPOINTER);
    
}

NSMutableDictionary* pointerMapping() {
    
    static id self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self = [LightWeightPlist class];
        objc_setAssociatedObject(self, &POINTERMAPPINGPOINTER, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });

    return objc_getAssociatedObject(self, &POINTERMAPPINGPOINTER);
    
}

NSFileManager* fileManager() {
    
    static id self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self = [LightWeightPlist class];
        objc_setAssociatedObject(self, &FILEMANAGERPOINTER, [NSFileManager defaultManager], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    });
    
    return objc_getAssociatedObject(self, &FILEMANAGERPOINTER);
    
}

@end
