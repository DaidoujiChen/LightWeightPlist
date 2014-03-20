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

    [FileManager removeItemAtPath:DocumentFile(key) error:NULL];
    [self removeObjectFromCache:key];
    
}

+(void) forceWrite {
    
    [Cache removeAllObjects];
    
}

#pragma mark array

+(NSMutableArray*) array : (NSString*) key {
    
    if ([self objectFromCache:key]) {
    } else if ([self arrayInDocument:key]) {
        [self setObjectToCache:[self arrayInDocument:key] withKey:key];
    } else if ([self arrayInResource:key]) {
        [self setObjectToCache:[self arrayInResource:key] withKey:key];
    } else {
        [self setObjectToCache:[NSMutableArray array] withKey:key];
    }
    return [self objectFromCache:key];
    
}

#pragma mark dictionary

+(NSMutableDictionary*) dictionary : (NSString*) key {
    
    if ([self objectFromCache:key]) {
    } else if ([self dictionaryInDocument:key]) {
        [self setObjectToCache:[self dictionaryInDocument:key] withKey:key];
    } else if ([self dictionaryInResource:key]) {
        [self setObjectToCache:[self dictionaryInResource:key] withKey:key];
    } else {
        [self setObjectToCache:[NSMutableDictionary dictionary] withKey:key];
    }
    return [self objectFromCache:key];
    
}

@end
