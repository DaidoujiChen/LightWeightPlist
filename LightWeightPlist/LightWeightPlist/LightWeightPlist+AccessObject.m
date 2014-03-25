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
    
    if (!objc_getAssociatedObject(classItSelf, &DATACACHEPOINTER)) {
        NSCache *dataCache = [[NSCache alloc] init];
        [dataCache setDelegate:(id<NSCacheDelegate>)classItSelf];
        objc_setAssociatedObject(classItSelf, &DATACACHEPOINTER, dataCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(classItSelf, &DATACACHEPOINTER);
    
}

NSMutableDictionary* pointerMapping() {
    
    if (!objc_getAssociatedObject(classItSelf, &POINTERMAPPINGPOINTER)) {
        objc_setAssociatedObject(classItSelf, &POINTERMAPPINGPOINTER, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(classItSelf, &POINTERMAPPINGPOINTER);
    
}

NSFileManager* fileManager() {
    
    if (!objc_getAssociatedObject(classItSelf, &FILEMANAGERPOINTER)) {
        objc_setAssociatedObject(classItSelf, &FILEMANAGERPOINTER, [NSFileManager defaultManager], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(classItSelf, &FILEMANAGERPOINTER);
    
}

@end
