//
//  NSMutableArray+array.m
//  LOL
//
//  Created by cy on 16/4/8.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NSMutableArray+array.h"

@implementation NSMutableArray (array)
/**
 *  查询字典值
 */
+ (instancetype)dictSelectFromKey:(NSDictionary *)dict
{
    __block NSMutableArray *article_id = [NSMutableArray array];
    for (id objc in dict) {
        [objc enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if ([key  isEqual: @"article_id"]) {
                [article_id addObject:[objc objectForKey:@"article_id"]];
                
            };
        }];
    }
    return article_id;
}
@end
