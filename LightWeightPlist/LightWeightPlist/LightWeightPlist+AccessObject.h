//
//  LightWeightPlist+AccessObject.h
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist.h"

#import "LightWeightPlistObjects.h"

#import <objc/runtime.h>

#define Cache objects().dataCache
#define PointerMapping objects().pointerMapping
#define FileManager objects().fileManager

#define funcSelf functionSelf()

@interface LightWeightPlist (AccessObject)

LightWeightPlistObjects* objects();
Class functionSelf();

@end
