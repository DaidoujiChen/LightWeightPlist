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
+(instancetype) getPlistFile : (NSString*) filename isArray : (BOOL) isArray inResource : (BOOL) inResource {
    NSString *path;
    
    if (inResource) {
        path = ResourceFile(filename);
    } else {
        path = DocumentFile(filename);
    }
    
    if (![FileManager fileExistsAtPath:path]) {
        return nil;
    } else {
        if (isArray) {
            return [NSMutableArray arrayWithContentsOfFile:path];
        } else {
            return [NSMutableDictionary dictionaryWithContentsOfFile:path];
        }
    }
}

+(NSMutableArray*) arrayInDocument : (NSString*) key {
    return (NSMutableArray*)[self getPlistFile:key isArray:YES inResource:NO];
}

+(NSMutableArray*) arrayInResource : (NSString*) key {
    return (NSMutableArray*)[self getPlistFile:key isArray:YES inResource:YES];
}

+(NSMutableDictionary*) dictionaryInDocument : (NSString*) key {
    return (NSMutableDictionary*)[self getPlistFile:key isArray:NO inResource:NO];
}

+(NSMutableDictionary*) dictionaryInResource : (NSString*) key {
    return (NSMutableDictionary*)[self getPlistFile:key isArray:NO inResource:YES];
}
@end
