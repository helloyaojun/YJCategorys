//
//  NSDictionary+Convert.h
//  Project
//
//  Created by yj on 16/4/11.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Convert)

//过滤字典中的空数据
- (id)filterNullValue:(NSDictionary *)dictionary;

//合并字典
- (id)addDictionary:(NSDictionary *)dictionary;

@end
