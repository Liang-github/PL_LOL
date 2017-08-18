//
//  NSDate+time.m
//  LOL
//
//  Created by cy on 16/1/30.
//  Copyright © 2016年 cy. All rights reserved.
//

#import "NSDate+time.h"

@implementation NSDate (time)

/** 是否是今年 */
- (BOOL)isInThisYear
{
    NSCalendar *calender = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    NSCalendarUnit unit = NSCalendarUnitYear;
    NSInteger selfComps = [calender component:unit fromDate:self];
    NSInteger dateComps = [calender component:unit fromDate:[NSDate date]];
    return selfComps == dateComps;
}


/** 是否是今天 */
- (BOOL)isInToday
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfComps = [calender components:unit fromDate:self];
    NSDateComponents *dateComps = [calender components:unit fromDate:[NSDate date]];
    return selfComps.year == dateComps.year
    && selfComps.hour == dateComps.hour
    && selfComps.day == dateComps.day;
    
}
@end
