//
//  LightWeightPlist+HandleCache.h
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/20.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "LightWeightPlist.h"

@interface LightWeightPlist (HandleCache) <NSCacheDelegate>
BOOL setObjectToCache(id object, NSString* key, Class obj);
id objectFromCache(NSString* key, Class obj);
void removeObjectFromCache(NSString* key, Class obj);
@end
