//
//  ViewController.m
//  ThirdPlatform
//
//  Created by Spider-xupeng on 2017/3/6.
//  Copyright © 2017年 Spider123. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)onLoginButtonClick:(UIButton *)sender {
    LoginViewController *vc = [LoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
