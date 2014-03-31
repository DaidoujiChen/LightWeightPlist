//
//  LightWeightPlist.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist.h"

#import "LightWeightPlist+AccessObject.h"
#import "LightWeightPlist+HandleCache.h"
#import "LightWeightPlist+SourceFromDisk.h"
#import "LightWeightPlist+FilePath.h"

@implementation LightWeightPlist

#pragma mark - general function
#pragma mark common

+(void) delete : (NSString*) key {

    [FileManager(self) removeItemAtPath:DocumentFile(key) error:NULL];
    removeObjectFromCache(key, self);
    
}

+(void) forceWrite {
    
    [Cache(self) removeAllObjects];
    
}

#pragma mark array

+(NSMutableArray*) array : (NSString*) key {
    
    if (!objectFromCache(key, self)) {
        NSMutableArray *returnObject = arrayInDocument(key, self);
        if (returnObject) {
            setObjectToCache(returnObject, key, self);
        } else {
            returnObject = arrayInResource(key, self);
            if (returnObject) {
                setObjectToCache(returnObject, key, self);
            } else {
                setObjectToCache([NSMutableArray array], key, self);
            }
        }
    }

    return objectFromCache(key, self);
    
}

+(NSMutableArray*) arrayFromResource : (NSString*) key {
    
    if (!objectFromCache(key, self)) {
        NSMutableArray *returnObject = arrayInResource(key, self);
        if (returnObject) {
            setObjectToCache(returnObject, key, self);
        } else {
            setObjectToCache([NSMutableArray array], key, self);
        }
    }
    
    return objectFromCache(key, self);
    
}

#pragma mark dictionary

+(NSMutableDictionary*) dictionary : (NSString*) key {
    
    if (!objectFromCache(key, self)) {
        NSMutableDictionary *returnObject = dictionaryInDocument(key, self);
        if (returnObject) {
            setObjectToCache(returnObject, key, self);
        } else {
            returnObject = dictionaryInResource(key, self);
            if (returnObject) {
                setObjectToCache(returnObject, key, self);
            } else {
                setObjectToCache([NSMutableDictionary dictionary], key, self);
            }
        }
    }

    return objectFromCache(key, self);
    
}

+(NSMutableDictionary*) dictionaryFromResource : (NSString*) key {
    
    if (!objectFromCache(key, self)) {
        NSMutableDictionary *returnObject = dictionaryInResource(key, self);
        if (returnObject) {
            setObjectToCache(returnObject, key, self);
        } else {
            setObjectToCache([NSMutableDictionary dictionary], key, self);
        }
    }
    
    return objectFromCache(key, self);
    
}

@end
