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
    
    if (objectFromCache(key, self)) {
    } else if (arrayInDocument(key, self)) {
        setObjectToCache(arrayInDocument(key, self), key, self);
    } else if (arrayInResource(key, self)) {
        setObjectToCache(arrayInResource(key, self), key, self);
    } else {
        setObjectToCache([NSMutableArray array], key, self);
    }
    return objectFromCache(key, self);
    
}

#pragma mark dictionary

+(NSMutableDictionary*) dictionary : (NSString*) key {
    
    if (objectFromCache(key, self)) {
    } else if (dictionaryInDocument(key, self)) {
        setObjectToCache(dictionaryInDocument(key, self), key, self);
    } else if (dictionaryInResource(key, self)) {
        setObjectToCache(dictionaryInResource(key, self), key, self);
    } else {
        setObjectToCache([NSMutableDictionary dictionary], key, self);
    }
    return objectFromCache(key, self);
    
}

@end
