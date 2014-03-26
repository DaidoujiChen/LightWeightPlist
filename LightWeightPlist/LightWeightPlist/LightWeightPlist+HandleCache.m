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

@implementation LightWeightPlist (HandleCache)

#pragma mark - NSCacheDelegate

+(void) cache : (NSCache*) cache willEvictObject : (id) obj {
    
    id associatedObject = objc_getAssociatedObject(self, (__bridge const void *)obj);
    
    NSString *filename = [PointerMapping(self) objectForKey:objectAddressString(obj)];
    
    NSString *path = DocumentFile(filename);
    
    if ([associatedObject isKindOfClass:[NSDictionary class]]) {
        [(NSDictionary*)associatedObject writeToFile:path atomically:YES];
    } else if ([associatedObject isKindOfClass:[NSArray class]]) {
        [(NSArray*)associatedObject writeToFile:path atomically:YES];
    }
    
    [PointerMapping(self) removeObjectForKey:objectAddressString(obj)];
    
}

#pragma mark - handle cahce

BOOL setObjectToCache(id object, NSString* key, Class obj) {
    
    if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSArray class]]) {
        NSObject *emptyObject = [NSObject new];
        [Cache(obj) setObject:emptyObject
                       forKey:key];
        objc_setAssociatedObject(obj, (__bridge const void *)[Cache(obj) objectForKey:key], object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [PointerMapping(obj) setObject:key forKey:objectAddressString([Cache(obj) objectForKey:key])];
        return YES;
    } else {
        return NO;
    }
    
}

id objectFromCache(NSString* key, Class obj) {
    
    return objc_getAssociatedObject(obj, (__bridge const void *)[Cache(obj) objectForKey:key]);
    
}

void removeObjectFromCache(NSString* key, Class obj) {
    
    if ([Cache(obj) objectForKey:key]) {
        [PointerMapping(obj) removeObjectForKey:objectAddressString([Cache(obj) objectForKey:key])];
        [Cache(obj) removeObjectForKey:key];
    }
    
}

@end
