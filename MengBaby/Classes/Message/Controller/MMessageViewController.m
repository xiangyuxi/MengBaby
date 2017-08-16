//
//  MMessageViewController.m
//  MengBaby
//
//  Created by xiangyuxi on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "MMessageViewController.h"

@interface MMessageViewController ()
{
    struct {
        NSInteger SelectedTagFlag;
    } MMFlags;
}

@property (weak, nonatomic) IBOutlet UIView *navbarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *flagViewCenterConstraint;
@property (weak, nonatomic) IBOutlet UIView *flagView;

@end

@implementation MMessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews
{
    MMFlags.SelectedTagFlag = 0;
    
    self.flagView.layer.cornerRadius = self.flagView.height/2;
    self.flagViewCenterConstraint.constant = SCREEN_WIDTH*0.3;
}

#pragma mark - Actions

- (IBAction)tabbarButtonAction:(UIButton *)sender
{
    NSInteger tag = sender.tag-10;
    if (MMFlags.SelectedTagFlag != tag) {
        sender.selected = !sender.selected;
        
        UIButton* lastBtn = [self.navbarView viewWithTag:MMFlags.SelectedTagFlag+10];
        lastBtn.selected = !lastBtn.selected;
        
        POPSpringAnimation* springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        springAnimation.springSpeed = 0.4;
        springAnimation.springBounciness = 0.8;
        springAnimation.toValue = @(sender.center.x);
        [self.flagViewCenterConstraint pop_addAnimation:springAnimation forKey:nil];
        
        MMFlags.SelectedTagFlag = tag;
    }
}

@end
