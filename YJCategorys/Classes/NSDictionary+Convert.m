//
//  NSDictionary+Convert.m
//  Project
//
//  Created by yj on 16/4/11.
//  Copyright © 2016年 user. All rights reserved.
//

#import "NSDictionary+Convert.h"

@implementation NSDictionary (Convert)


//过滤字典中的空数据
- (id)filterNullValue:(NSDictionary *)dictionary {
    
    NSMutableDictionary *filterDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    NSArray *allKeys = [dictionary allKeys];
    for (NSString *key in allKeys) {
        NSObject *obj = [dictionary objectForKey:key];
        if (![obj isEqual:[NSNull null]]) {
            [filterDictionary setObject:obj forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:filterDictionary];
}

//合并字典
- (id)addDictionary:(NSDictionary *)dictionary {
    
    NSMutableDictionary *mergeDictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    [mergeDictionary addEntriesFromDictionary:dictionary];
    
    return [NSDictionary dictionaryWithDictionary:mergeDictionary];
}
@end
