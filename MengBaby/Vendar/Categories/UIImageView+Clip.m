//
//  UIImageView+Clip.m
//  MengBaby
//
//  Created by yxiang on 2017/8/17.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "UIImageView+Clip.h"

@implementation UIImageView (Clip)

- (void)imageViewSetCornerRadius:(CGFloat)cornerRadius
{
    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
