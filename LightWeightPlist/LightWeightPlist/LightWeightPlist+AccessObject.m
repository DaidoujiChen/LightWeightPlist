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

NSCache* dataCache(Class object) {
    
    if (!objc_getAssociatedObject(object, &DATACACHEPOINTER)) {
        NSCache *dataCache = [[NSCache alloc] init];
        [dataCache setDelegate:(id<NSCacheDelegate>)object];
        objc_setAssociatedObject(object, &DATACACHEPOINTER, dataCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(object, &DATACACHEPOINTER);
    
}

NSMutableDictionary* pointerMapping(Class object) {
    
    if (!objc_getAssociatedObject(object, &POINTERMAPPINGPOINTER)) {
        objc_setAssociatedObject(object, &POINTERMAPPINGPOINTER, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(object, &POINTERMAPPINGPOINTER);
    
}

NSFileManager* fileManager(Class object) {
    
    if (!objc_getAssociatedObject(object, &FILEMANAGERPOINTER)) {
        objc_setAssociatedObject(object, &FILEMANAGERPOINTER, [NSFileManager defaultManager], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(object, &FILEMANAGERPOINTER);
    
}

@end
