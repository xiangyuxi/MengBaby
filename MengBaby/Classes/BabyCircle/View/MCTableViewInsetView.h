//
//  MCTableViewInsetView.h
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCTableViewInsetView : UIView

@property (weak, nonatomic) IBOutlet UIImageView* themeImageView;
@property (weak, nonatomic) IBOutlet UIToolbar* effectiveView;
@property (weak, nonatomic) IBOutlet UILabel* userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView* userIconImageView;
@property (weak, nonatomic) IBOutlet UILabel* dateLabel;
@property (weak, nonatomic) IBOutlet UIView* shadowView;

@end
