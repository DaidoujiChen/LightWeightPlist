//
//  LightWeightPlist+AccessObject.h
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist.h"

#import <objc/runtime.h>
#import <objc/message.h>

#define Cache(fmt) dataCache(fmt)
#define PointerMapping(fmt) pointerMapping(fmt)
#define FileManager(fmt) fileManager(fmt)

@interface LightWeightPlist (AccessObject)
NSCache* dataCache(Class object);
NSMutableDictionary* pointerMapping(Class object);
NSFileManager* fileManager(Class object);
@end
