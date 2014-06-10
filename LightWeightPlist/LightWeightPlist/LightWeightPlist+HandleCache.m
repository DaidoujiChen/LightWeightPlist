//
//  LightWeightPlist+HandleCache.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+HandleCache.h"

#import <objc/message.h>

#import "LightWeightPlist+AccessObject.h"
#import "LightWeightPlist+MiscFunctions.h"
#import "LightWeightPlist+FilePath.h"

#define Bridge(fmt) ((__bridge const void *)fmt)

@implementation LightWeightPlist (HandleCache)

#pragma mark - NSCacheDelegate

+(void) cache : (NSCache*) cache willEvictObject : (id) obj {
    
    id associatedObject = objc_getAssociatedObject(self, Bridge(obj));
    
    NSString *filename = [PointerMapping objectForKey:objectAddressString(obj)];
    
    NSString *path = DocumentFile(filename);
    
    static BOOL atomically;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        atomically = YES;
    });
    
    objc_msgSend(associatedObject, @selector(writeToFile:atomically:), path, &atomically);
    
    [PointerMapping removeObjectForKey:objectAddressString(obj)];
    
}

#pragma mark - handle cahce

BOOL setObjectToCache(id object, NSString* key) {
    
    if (isDictionary(object) || isArray(object)) {
        NSObject *emptyObject = [NSObject new];
        [Cache setObject:emptyObject
                  forKey:key];
        objc_setAssociatedObject(funcSelf, Bridge([Cache objectForKey:key]), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [PointerMapping setObject:key forKey:objectAddressString([Cache objectForKey:key])];
        return YES;
    } else {
        return NO;
    }
    
}

id objectFromCache(NSString* key) {
    
    return objc_getAssociatedObject(funcSelf, Bridge([Cache objectForKey:key]));
    
}

void removeObjectFromCache(NSString* key) {
    
    if ([Cache objectForKey:key]) {
        [PointerMapping removeObjectForKey:objectAddressString([Cache objectForKey:key])];
        [Cache removeObjectForKey:key];
    }
    
}

@end
