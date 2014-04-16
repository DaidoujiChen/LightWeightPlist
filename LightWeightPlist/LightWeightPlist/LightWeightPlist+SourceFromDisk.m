//
//  LightWeightPlist+SourceFromDisk.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+SourceFromDisk.h"

#import "LightWeightPlist+AccessObject.h"
#import "LightWeightPlist+FilePath.h"

@implementation LightWeightPlist (SourceFromDisk)

id getPlistFile(NSString* filename, BOOL isArray, BOOL inResource) {
    NSString *path;
    
    if (inResource) {
        path = ResourceFile(filename);
    } else {
        path = DocumentFile(filename);
    }
    
    if (![FileManager() fileExistsAtPath:path]) {
        return nil;
    } else {
        if (isArray) {
            return [NSMutableArray arrayWithContentsOfFile:path];
        } else {
            return [NSMutableDictionary dictionaryWithContentsOfFile:path];
        }
    }
}

NSMutableArray* arrayInDocument(NSString* key) {
    return getPlistFile(key, YES, NO);
}

NSMutableArray* arrayInResource(NSString* key) {
    return getPlistFile(key, YES, YES);
}

NSMutableDictionary* dictionaryInDocument(NSString* key) {
    return getPlistFile(key, NO, NO);
}

NSMutableDictionary* dictionaryInResource(NSString* key) {
    return getPlistFile(key, NO, YES);
}

@end
