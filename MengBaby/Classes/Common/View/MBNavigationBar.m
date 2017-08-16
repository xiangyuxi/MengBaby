//
//  MBNavigationBar.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MBNavigationBar.h"

@implementation MBNavigationBar

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.rightButton.backgroundColor = COLOR_OF_HEXALPHA(0xffffff, 0.4);
    self.rightButton.clipsToBounds = YES;
    self.rightButton.layer.cornerRadius = 17.5f;
}

- (void)setBgColorAlpha:(CGFloat)bgColorAlpha
{
    _bgColorAlpha = bgColorAlpha;
    self.backgroundColor = COLOR_OF_HEXALPHA(0xffffff, bgColorAlpha);
    self.bottomLineImageView.alpha = bgColorAlpha;
}

@end
