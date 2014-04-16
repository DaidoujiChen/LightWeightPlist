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

#define Cache() dataCache()
#define PointerMapping() pointerMapping()
#define FileManager() fileManager()

@interface LightWeightPlist (AccessObject)
NSCache* dataCache();
NSMutableDictionary* pointerMapping();
NSFileManager* fileManager();
@end
