//
//  BCViewController.m
//  MengBaby
//
//  Created by yxiang on 2017/8/16.
//  Copyright © 2017年 yxiang. All rights reserved.
//

#import "BCViewController.h"
#import "MCTableViewInsetView.h"

static const CGFloat kTableViewContentInsetViewInitHeight = 294.f;
static const CGFloat kToolbarAlphaDifferHeight = 60.f;
static const CGFloat kNavigationBarHeight = 64.f;

@interface BCViewController () <UITableViewDelegate>
{
    struct {
        BOOL StatusBarFlag;
    } MCFlags;
}

@property (weak, nonatomic) MCTableViewInsetView*   tableViewInsetView;
@property (weak, nonatomic) IBOutlet UITableView*   tableView;

@end

@implementation BCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configSubviews];
}

- (void)configSubviews
{
    self.title = @"Meng Circle";
    
    self.tableView.contentInset = UIEdgeInsetsMake(kTableViewContentInsetViewInitHeight, 0, 0, 0);
    self.tableViewInsetView = [MCTableViewInsetView loadInstanceFromNib];
    self.tableViewInsetView.frame = CGRectMake(0, -kTableViewContentInsetViewInitHeight, SCREEN_WIDTH, kTableViewContentInsetViewInitHeight);
    [self.tableView addSubview:self.tableViewInsetView];
}

#pragma mark - UIStatusBarStyle

- (UIStatusBarStyle)preferredStatusBarStyle
{
    if (MCFlags.StatusBarFlag) {
        return UIStatusBarStyleDefault;
    }else {
        return UIStatusBarStyleLightContent;
    }
}

#pragma mark - UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y+kTableViewContentInsetViewInitHeight;
    
    // Theme animation effection
    if (offsetY <= 0) {
        self.navigationBar.backgroundColor = [UIColor clearColor];
        self.navigationBar.bottomLineImageView.alpha = 0;
        
        CGFloat height = kTableViewContentInsetViewInitHeight+ABS(offsetY);
        CGFloat rate = height/kTableViewContentInsetViewInitHeight;
        CGFloat width = SCREEN_WIDTH*rate;
        self.tableViewInsetView.frame = CGRectMake((SCREEN_WIDTH-width)/2, -kTableViewContentInsetViewInitHeight+offsetY, width, height);
        
        CGFloat alpha = 1-MIN(1, MAX(0, ABS(offsetY)/kToolbarAlphaDifferHeight));
        self.tableViewInsetView.effectiveView.alpha = alpha;
    }
    
    // Navigation animation effection
    if (offsetY >= 0) {
        self.tableViewInsetView.effectiveView.alpha = 1;
        
        CGFloat alpha = offsetY/(kTableViewContentInsetViewInitHeight-kNavigationBarHeight);
        alpha = MIN(MAX(alpha, 0), 1);
        self.navigationBar.bgColorAlpha = alpha;
        
        // StatusBar animation effection
        if (alpha > 0.4 && !MCFlags.StatusBarFlag) {
            MCFlags.StatusBarFlag = YES;
            [UIView animateWithDuration:0.2 animations:^{
                [self setNeedsStatusBarAppearanceUpdate];
            }];
        }else if (alpha <= 0.4 && MCFlags.StatusBarFlag) {
            MCFlags.StatusBarFlag = NO;
            [UIView animateWithDuration:0.2 animations:^{
                [self setNeedsStatusBarAppearanceUpdate];
            }];
        }
    }
}

@end
