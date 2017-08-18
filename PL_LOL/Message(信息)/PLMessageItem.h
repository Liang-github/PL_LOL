//
//  PLMessageItem.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PLMessageItem : NSObject
//文章唯一标示逐渐增长
@property (nonatomic, assign) NSInteger article_id;

@property (nonatomic, copy) NSString *article_url;
//是否为资源视频资源
@property (nonatomic, copy) NSString *is_direct;
//小图片资源
@property (nonatomic, copy) NSString *image_url_small;
//小图片资源
@property (nonatomic, copy) NSString *image_url_big;
//上一次加载时间
@property (nonatomic, copy) NSString *insert_date;
//这一次加载时间
@property (nonatomic, copy) NSString *publication_date;
//子标题
@property (nonatomic, copy) NSString *summary;
//标题
@property (nonatomic, copy) NSString *title;
@end
