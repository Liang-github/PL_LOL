//
//  CYCacheTool.h
//  LOL
//
//  Created by cy on 16/4/1.
//  Copyright © 2016年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYCacheTool : NSObject

/**
 *  缓存管理者
 *
 */
+ (instancetype)shareManeger;
/**
 *  添加数据
 */
- (void)addJsondata:(NSData *)data name:(NSString *)name;


/**
 *  查询数据
 */
- (NSData *)slectDataFromSqilteWithParamer:(NSString *)controllerName;

/**
 *  更新数据
 */
- (void)updateDataFromControllerName:(NSString *)controllerName newData:(NSData *)newData;
@end
