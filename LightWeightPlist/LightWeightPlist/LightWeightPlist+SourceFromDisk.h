//
//  LightWeightPlist+SourceFromDisk.h
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist.h"

@interface LightWeightPlist (SourceFromDisk)

NSMutableArray* arrayInDocument(NSString* key, Class obj);
NSMutableArray* arrayInResource(NSString* key, Class obj);
NSMutableDictionary* dictionaryInDocument(NSString* key, Class obj);
NSMutableDictionary* dictionaryInResource(NSString* key, Class obj);

@end
