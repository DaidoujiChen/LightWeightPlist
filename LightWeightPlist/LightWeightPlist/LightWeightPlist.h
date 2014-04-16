//
//  LightWeightPlist.h
//  LightWeightPlist
//
//  Created by 啟倫 陳 on 2014/3/4.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LWPArray(fmt) array(fmt)
#define LWPArrayR(fmt) arrayFromResource(fmt)
#define LWPDictionary(fmt) dictionary(fmt)
#define LWPDictionaryR(fmt) dictionaryFromResource(fmt)
#define LWPDelete(fmt) delete(fmt)
#define LWPForceWrite() forceWrite()

@interface LightWeightPlist : NSObject

#pragma mark - Common

void delete(NSString* key);
void forceWrite();

#pragma mark - Array

NSMutableArray* array(NSString* key);
NSMutableArray* arrayFromResource(NSString* key);

#pragma mark - Dictionary

NSMutableDictionary* dictionary(NSString* key);
NSMutableDictionary* dictionaryFromResource(NSString* key);

@end
