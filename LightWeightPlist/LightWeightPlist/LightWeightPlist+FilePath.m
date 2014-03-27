//
//  LightWeightPlist+FilePath.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist+FilePath.h"

#import "LightWeightPlist+AccessObject.h"

@implementation LightWeightPlist (FilePath)

typedef id (*invokeIMP)(id, SEL, ...);

NSString* resourceFolderPath() {
    
    static NSString *resourceDirectory;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        resourceDirectory = [[NSBundle mainBundle] bundlePath];
    });
    
    return resourceDirectory;
    
}

NSString* documentFolderPath() {
    
    static NSString *documentsDirectory;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory = [paths objectAtIndex:0];
    });
    
    return documentsDirectory;
    
}

static IMP stringByAppendingPathComponentIMP;

NSString* resourceFolderPathWithFilename (NSString* filename) {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stringByAppendingPathComponentIMP = class_getMethodImplementation([NSString class], @selector(stringByAppendingPathComponent:));
    });
    
    invokeIMP stringByAppendingPathComponent = (invokeIMP) stringByAppendingPathComponentIMP;

    return stringByAppendingPathComponent(resourceFolderPath(), @selector(stringByAppendingPathComponent:), [NSString stringWithFormat:@"%@.plist", filename]);
    
}

NSString* documentFolderPathWithFilename (NSString* filename) {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stringByAppendingPathComponentIMP = class_getMethodImplementation([NSString class], @selector(stringByAppendingPathComponent:));
    });
    
    invokeIMP stringByAppendingPathComponent = (invokeIMP) stringByAppendingPathComponentIMP;
    
    return stringByAppendingPathComponent(documentFolderPath(), @selector(stringByAppendingPathComponent:), [NSString stringWithFormat:@"%@.plist", filename]);
    
}

@end
