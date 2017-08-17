//
//  MCTableViewInsetView.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MCTableViewInsetView.h"

@implementation MCTableViewInsetView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.userIconImageView.layer.borderColor = MENG_WHITE_COLOR.CGColor;
    self.userIconImageView.layer.borderWidth = 3.f;
    self.userIconImageView.layer.cornerRadius = 40.f;
    [self.userIconImageView imageViewSetCornerRadius:40.f];
    
    self.shadowView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.shadowView.bounds cornerRadius:40.f].CGPath;
    self.shadowView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.shadowView.layer.shadowOpacity = 1;
    self.shadowView.layer.shadowRadius = 6;
    self.shadowView.layer.shadowOffset = CGSizeMake(0, 3);
    
    self.dateLabel.text = DATE_TO_WEEKDAY([NSDate date]);
}

@end
