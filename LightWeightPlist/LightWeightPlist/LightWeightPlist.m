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

void delete(NSString* key) {

    [FileManager() removeItemAtPath:DocumentFile(key) error:NULL];
    removeObjectFromCache(key);
    
}

void forceWrite() {
    
    [Cache() removeAllObjects];
    
}

#pragma mark array

NSMutableArray* array(NSString* key) {
    
    if (!objectFromCache(key)) {
        NSMutableArray *returnObject = arrayInDocument(key);
        if (returnObject) {
            setObjectToCache(returnObject, key);
        } else {
            returnObject = arrayInResource(key);
            if (returnObject) {
                setObjectToCache(returnObject, key);
            } else {
                setObjectToCache([NSMutableArray array], key);
            }
        }
    }

    return objectFromCache(key);
    
}

NSMutableArray* arrayFromResource(NSString* key) {
    
    if (!objectFromCache(key)) {
        NSMutableArray *returnObject = arrayInResource(key);
        if (returnObject) {
            setObjectToCache(returnObject, key);
        } else {
            setObjectToCache([NSMutableArray array], key);
        }
    }
    
    return objectFromCache(key);
    
}

#pragma mark dictionary

NSMutableDictionary* dictionary(NSString* key) {
    
    if (!objectFromCache(key)) {
        NSMutableDictionary *returnObject = dictionaryInDocument(key);
        if (returnObject) {
            setObjectToCache(returnObject, key);
        } else {
            returnObject = dictionaryInResource(key);
            if (returnObject) {
                setObjectToCache(returnObject, key);
            } else {
                setObjectToCache([NSMutableDictionary dictionary], key);
            }
        }
    }

    return objectFromCache(key);
    
}

NSMutableDictionary* dictionaryFromResource(NSString* key) {
    
    if (!objectFromCache(key)) {
        NSMutableDictionary *returnObject = dictionaryInResource(key);
        if (returnObject) {
            setObjectToCache(returnObject, key);
        } else {
            setObjectToCache([NSMutableDictionary dictionary], key);
        }
    }
    
    return objectFromCache(key);
    
}

@end
