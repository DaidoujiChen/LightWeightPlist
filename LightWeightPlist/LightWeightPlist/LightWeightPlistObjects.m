//
//  LightWeightPlistObjects.m
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/6/10.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlistObjects.h"

@implementation LightWeightPlistObjects

-(id) init {
    
    self = [super init];
    if (self) {
        self.dataCache = [NSCache new];
        self.pointerMapping = [NSMutableDictionary dictionary];
        self.fileManager = [NSFileManager defaultManager];
    }
    return self;
    
}

@end
