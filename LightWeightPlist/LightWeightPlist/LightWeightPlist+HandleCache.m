//
//  LightWeightPlist+HandleCache.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+HandleCache.h"

#import "LightWeightPlist+AccessObject.h"
#import "LightWeightPlist+MiscFunctions.h"
#import "LightWeightPlist+FilePath.h"

#define Bridge(fmt) ((__bridge const void *)fmt)

@implementation LightWeightPlist (HandleCache)

#pragma mark - NSCacheDelegate

+(void) cache : (NSCache*) cache willEvictObject : (id) obj {
    
    id associatedObject = objc_getAssociatedObject(self, Bridge(obj));
    
    NSString *filename = [PointerMapping(self) objectForKey:objectAddressString(obj)];
    
    NSString *path = DocumentFile(filename);
    
    static BOOL atomically;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        atomically = YES;
    });
    
    objc_msgSend(associatedObject, @selector(writeToFile:atomically:), path, &atomically);
    
    [PointerMapping(self) removeObjectForKey:objectAddressString(obj)];
    
}

#pragma mark - handle cahce

BOOL setObjectToCache(id object, NSString* key, Class obj) {
    
    if (isDictionary(object) || isArray(object)) {
        NSObject *emptyObject = [NSObject new];
        [Cache(obj) setObject:emptyObject
                       forKey:key];
        objc_setAssociatedObject(obj, Bridge([Cache(obj) objectForKey:key]), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [PointerMapping(obj) setObject:key forKey:objectAddressString([Cache(obj) objectForKey:key])];
        return YES;
    } else {
        return NO;
    }
    
}

id objectFromCache(NSString* key, Class obj) {
    
    return objc_getAssociatedObject(obj, Bridge([Cache(obj) objectForKey:key]));
    
}

void removeObjectFromCache(NSString* key, Class obj) {
    
    if ([Cache(obj) objectForKey:key]) {
        [PointerMapping(obj) removeObjectForKey:objectAddressString([Cache(obj) objectForKey:key])];
        [Cache(obj) removeObjectForKey:key];
    }
    
}

@end
