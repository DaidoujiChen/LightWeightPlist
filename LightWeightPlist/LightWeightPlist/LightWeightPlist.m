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

+(void) load {
    classItSelf = self;
}

#pragma mark - general function
#pragma mark common

+(void) delete : (NSString*) key {

    [FileManager removeItemAtPath:DocumentFile(key) error:NULL];
    removeObjectFromCache(key);
    
}

+(void) forceWrite {
    
    [Cache removeAllObjects];
    
}

#pragma mark array

+(NSMutableArray*) array : (NSString*) key {
    
    if (objectFromCache(key)) {
    } else if (arrayInDocument(key)) {
        setObjectToCache(arrayInDocument(key), key);
    } else if (arrayInResource(key)) {
        setObjectToCache(arrayInResource(key), key);
    } else {
        setObjectToCache([NSMutableArray array], key);
    }
    return objectFromCache(key);
    
}

#pragma mark dictionary

+(NSMutableDictionary*) dictionary : (NSString*) key {
    
    if (objectFromCache(key)) {
    } else if (dictionaryInDocument(key)) {
        setObjectToCache(dictionaryInDocument(key), key);
    } else if (dictionaryInResource(key)) {
        setObjectToCache(dictionaryInResource(key), key);
    } else {
        setObjectToCache([NSMutableDictionary dictionary], key);
    }
    return objectFromCache(key);
    
}

@end
