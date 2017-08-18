//
//  NSMutableArray+array.h
//  LOL
//
//  Created by cy on 16/4/8.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (array)
/**
 *  查询字典值
 */
+ (instancetype)dictSelectFromKey:(NSDictionary *)dict;
@end
