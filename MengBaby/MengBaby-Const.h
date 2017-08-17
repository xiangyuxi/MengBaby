//
//  MengBaby-Const.h
//  MengBaby
//
//  Created by yxiang on 2017/8/15.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_INLINE NSString* WeekdayFromDate(NSDate* date)
{
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents* comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    return @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"][comps.weekday-1];
}

#define COLOR_OF_HEX(_H) [UIColor colorWithHex:_H]
#define COLOR_OF_HEXALPHA(_H,_A) [UIColor colorWithHex:_H alpha:_A]

#define MENG_RED_COLOR    COLOR_OF_HEX(0xff5555)
#define MENG_BLACK_COLOR  COLOR_OF_HEX(0x000000)
#define MENG_WHITE_COLOR  COLOR_OF_HEX(0xf8f8f8)

#define SCREEN_WIDTH      CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREEN_HEIGHT     CGRectGetHeight([UIScreen mainScreen].bounds)

#define DATE_TO_FORMATTER(_F,_D)    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];\
                                    [dateFormatter setDateFormat:_F];\
                                    NSString* strDate = [dateFormatter stringFromDate:_D];
#define DATE_TO_WEEKDAY(_D)         WeekdayFromDate(_D)

UIKIT_EXTERN const NSString* LCAppID;
UIKIT_EXTERN const NSString* LCAppKey;
UIKIT_EXTERN const NSString* LCMasterKey;

