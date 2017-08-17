//
//  MyselfCell.m
//  MengBaby
//
//  Created by yxiang on 2017/8/17.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MyselfCell.h"

@implementation MyselfCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.userIconImageView.layer.borderColor = MENG_BLACK_COLOR.CGColor;
    self.userIconImageView.layer.borderWidth = 0.1;
    self.userIconImageView.layer.cornerRadius = 8.f;
}

@end
