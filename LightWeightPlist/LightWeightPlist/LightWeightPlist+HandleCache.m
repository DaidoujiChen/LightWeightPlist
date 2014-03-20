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
    
    NSString *filename = [PointerMapping objectForKey:[self objectAddressString:obj]];
    
    NSString *path = DocumentFile(filename);
    
    if ([associatedObject isKindOfClass:[NSDictionary class]]) {
        [(NSDictionary*)associatedObject writeToFile:path atomically:YES];
    } else if ([associatedObject isKindOfClass:[NSArray class]]) {
        [(NSArray*)associatedObject writeToFile:path atomically:YES];
    }
    
    [PointerMapping removeObjectForKey:[self objectAddressString:obj]];
    
}

#pragma mark - handle cahce

+(BOOL) setObjectToCache : (id) object withKey : (NSString*) key {
    
    if ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSArray class]]) {
        NSObject *emptyObject = [NSObject new];
        [Cache setObject:emptyObject
                  forKey:key];
        objc_setAssociatedObject(self, (__bridge const void *)[Cache objectForKey:key], object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [PointerMapping setObject:key forKey:[self objectAddressString:[Cache objectForKey:key]]];
        return YES;
    } else {
        return NO;
    }
    
}

+(id) objectFromCache : (NSString*) key {
    
    return objc_getAssociatedObject(self, (__bridge const void *)[Cache objectForKey:key]);
    
}

+(void) removeObjectFromCache : (NSString*) key {
    
    if ([Cache objectForKey:key]) {
        [PointerMapping removeObjectForKey:[self objectAddressString:[Cache objectForKey:key]]];
        [Cache removeObjectForKey:key];
    }
    
}

@end
