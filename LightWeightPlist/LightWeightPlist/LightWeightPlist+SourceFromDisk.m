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

id getPlistFile(NSString* filename, BOOL isArray, BOOL inResource, Class obj) {
    NSString *path;
    
    if (inResource) {
        path = ResourceFile(filename);
    } else {
        path = DocumentFile(filename);
    }
    
    if (![FileManager(obj) fileExistsAtPath:path]) {
        return nil;
    } else {
        if (isArray) {
            return [NSMutableArray arrayWithContentsOfFile:path];
        } else {
            return [NSMutableDictionary dictionaryWithContentsOfFile:path];
        }
    }
}

NSMutableArray* arrayInDocument(NSString* key, Class obj) {
    return getPlistFile(key, YES, NO, obj);
}

NSMutableArray* arrayInResource(NSString* key, Class obj) {
    return getPlistFile(key, YES, YES, obj);
}

NSMutableDictionary* dictionaryInDocument(NSString* key, Class obj) {
    return getPlistFile(key, NO, NO, obj);
}

NSMutableDictionary* dictionaryInResource(NSString* key, Class obj) {
    return getPlistFile(key, NO, YES, obj);
}

@end
