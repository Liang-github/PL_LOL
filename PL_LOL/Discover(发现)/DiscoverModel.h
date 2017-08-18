//
//  DiscoverModel.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoverModel : NSObject
//文章ID
@property (nonatomic, copy) NSString *article_id;
//文章地址
@property (nonatomic, copy) NSString *article_url;
//文章图片地址
@property (nonatomic, copy) NSString *image_url_big;

@property (nonatomic, copy) NSString *is_direct;
//索引
@property (nonatomic, copy) NSString *section_index;
//文章标题
@property (nonatomic, copy) NSString *title;
//是否为新
@property (nonatomic, copy) NSString *is_new;

@property (nonatomic, copy) NSString *pos_index;
@end
