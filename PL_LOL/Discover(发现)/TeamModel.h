//
//  TeamModel.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamModel : NSObject

//战队名字
@property (nonatomic, copy) NSString *name;
//战队图片
@property (nonatomic, copy) NSString *iconUrl;
//粉丝数量
@property (nonatomic, copy) NSString *fansCount;
//编号
@property (nonatomic, copy) NSString *id;
@end
