//
//  PLMessageCell.m
//  PL_LOL
//
//  Created by PengLiang on 2017/8/21.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "PLMessageCell.h"
#import <UIImageView+WebCache.h>
@implementation PLMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(10, 10, 75, 50);
        _bgView.backgroundColor = kColor(251, 223, 100);
        [self.contentView addSubview:_bgView];
        
        _imageV = [[UIImageView alloc] init];
        _imageV.frame = CGRectMake(0, 0, 75, 50);
        [_bgView addSubview:_imageV];
        
        _playImage = [[UIImageView alloc] init];
        _playImage.frame = CGRectMake(49, 23.5, 23, 23);
        _playImage.image = [UIImage imageNamed:@"hero_time_small_mark"];
        [_bgView addSubview:_playImage];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(95, 10, 220, 19.5);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
        
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.frame = CGRectMake(95, 29, 220, 30);
        _subTitleLabel.textColor = [UIColor lightGrayColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.numberOfLines = 2;
        [self.contentView addSubview:_subTitleLabel];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(self.contentView.width - 35, self.contentView.height - 18, 30, 13);
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_timeLabel];
    }
    
    return self;
}
- (void)setItem:(PLMessageItem *)item {
    _item = item;
    self.titleLabel.text = item.title;
    self.subTitleLabel.text = item.summary;
    
    NSURL *url = [NSURL URLWithString:item.image_url_small];
    [self.imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default_hero_head"]];
    
    if ([item.article_url hasPrefix:@"http://"]) {
        self.playImage.hidden = NO;
    } else {
        self.playImage.hidden = YES;
    }
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-mm-dd HH:mm:ss";
    NSDate *date = [fmt dateFromString:item.publication_date];
    NSCalendarUnit unit = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:unit fromDate:date toDate:[NSDate date] options:0];
    if (date.isInThisYear) {
        if (date.isInToday) {
            if (comps.hour >= 1) {
                self.timeLabel.text = [NSString stringWithFormat:@"%ld小时前",(long)comps.hour];
            } else if (comps.minute >= 1) {
                self.timeLabel.text = [NSString stringWithFormat:@"%ld分钟前",(long)comps.minute];
            } else {
                self.timeLabel.text = @"刚刚";
            }
        } else {
            fmt.dateFormat = @"MM-dd";
            self.timeLabel.text = [fmt stringFromDate:date];
        }
    } else {
        fmt.dateFormat = @"yyyy-MM-dd";
        self.timeLabel.text = [fmt stringFromDate:date];
    }
}
@end
