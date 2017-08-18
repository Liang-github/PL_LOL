//
//  PLSectionCell.h
//  PL_LOL
//
//  Created by PengLiang on 2017/8/18.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLSectionCellDelegate <NSObject>

@optional
- (void)cellIconViewClickWithTag:(NSInteger)viewTag;

@end
@interface PLSectionCell : UITableViewCell

@property (nonatomic, strong) NSArray *itemArr;
@property (nonatomic, weak) id<PLSectionCellDelegate> delegate;
@end
