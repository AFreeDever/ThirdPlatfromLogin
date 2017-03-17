//
//  SecondViewController.m
//  ThirdPlatform
//
//  Created by Spider-xupeng on 2017/3/6.
//  Copyright © 2017年 Spider123. All rights reserved.
//

#import "LoginViewController.h"
#import "XPShowThirdPlatformView.h"
#import "XPThirdPlatformLoginManager.h"


@interface LoginViewController ()<XPShowThirdPlatformViewDelegate> {
    XPShowThirdPlatformView *showView;

}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    showView = [XPShowThirdPlatformView new];
    showView.frame = CGRectMake(0, ScreenHeigth - 100, ScreenWidth, 45);
    showView.platformIconGroup = [NSMutableArray arrayWithObjects:
        @{@"login_icon_qq":@(XPThirdPlatformLoginTypeQQ)},
        @{@"login_icon_sina":@(XPThirdPlatformLoginTypeSina)},
        @{@"login_icon_alipay":@(XPThirdPlatformLoginTypeAlipay)},
        @{@"login_icon_weChat":@(XPThirdPlatformLoginTypeWechat)},
        nil];
    showView.platformTitleGroup = [NSMutableArray arrayWithObjects:
        @{@"QQ":@(XPThirdPlatformLoginTypeQQ)},
        @{@"新浪":@(XPThirdPlatformLoginTypeSina)},
        @{@"支付宝":@(XPThirdPlatformLoginTypeAlipay)},
        @{@"微信":@(XPThirdPlatformLoginTypeWechat)},
        nil];
    showView.titleTopEdge = 15.0;
    [showView setupThirdPlatformItemsWithSize:CGSizeMake(45.0, 45.0) space:25.0];
    showView.delegate = self;
    showView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:showView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showThirdPlatformView:(XPShowThirdPlatformView *)thirdPlatformView didSelectPlatformItemWithType:(XPThirdPlatformLoginType)type {
    XPThirdPlatformLoginManager *manager = [[XPThirdPlatformLoginManager alloc] init];
    [manager thirdPlatformLoginWithPlatformType:type completion:^(id result, id error) {
        
    }];
}

@end
