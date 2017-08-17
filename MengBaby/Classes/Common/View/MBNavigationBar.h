//
//  MBNavigationBar.h
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBNavigationBar : UIView

@property (weak, nonatomic) IBOutlet UILabel* titleLabel;
@property (weak, nonatomic) IBOutlet UIButton* rightButton;
@property (weak, nonatomic) IBOutlet UIImageView* bottomLineImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* titleLabelLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint* titleLabelCenterConstraint;
@property (weak, nonatomic) IBOutlet UIButton* backButton;

@property (assign, nonatomic) CGFloat bgColorAlpha;

@end
