//
//  PWThirdPlatformLoginManager.m
//  PaiWoYa
//
//  Created by Spider-xupeng on 2017/2/27.
//  Copyright © 2017年 spider. All rights reserved.
//

#import "XPThirdPlatformLoginManager.h"
//#import "PWUrlAPI.h"

@interface XPThirdPlatformLoginManager ()

@property (nonatomic, copy) XPThirdPlatformloginCompletion completionHandle; // 声明完成后的block属性，用来保存各个平台登录操作完成后的结果

@property (nonatomic, strong) NSMutableDictionary *actionDictionary; // 事件集合

@end
@implementation XPThirdPlatformLoginManager

- (instancetype)init {
    if ([super init]) {
        [self creatAction];
        return self;
    }
    return nil;
}

#pragma mark -Public Method

- (void)thirdPlatformLoginWithPlatformType:(XPThirdPlatformLoginType)platfromType completion:(XPThirdPlatformloginCompletion)completion {
    [self didSelectPlatfromWithPlatfromType:platfromType];
    completion = self.completionHandle;
}

#pragma mark -Private Method

- (void)creatAction {
    NSString *wechatAction = NSStringFromSelector(@selector(onWechatPlatfromLoginAction));
    NSString *QQAction = NSStringFromSelector(@selector(onQQPlatfromLoginAction));
    NSString *alipayAction = NSStringFromSelector(@selector(onAlipayPlatfromLoginAction));
    NSString *sinaAction = NSStringFromSelector(@selector(onSinaPlatfromLoginAction));
    self.actionDictionary = [@{
                               @(XPThirdPlatformLoginTypeWechat): wechatAction,
                               @(XPThirdPlatformLoginTypeQQ): QQAction,
                               @(XPThirdPlatformLoginTypeSina): sinaAction,
                               @(XPThirdPlatformLoginTypeAlipay): alipayAction,
                               } mutableCopy];
}

- (void)didSelectPlatfromWithPlatfromType:(XPThirdPlatformLoginType)platfromType {
    NSArray *allKeysArray = [self.actionDictionary allKeys];
    [allKeysArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *key = (NSNumber *)obj;
        if ([key integerValue] == platfromType) {
            NSString *action = [self.actionDictionary objectForKey:key];
            if (!action) {
                return;
            }
            SEL selectorAction = NSSelectorFromString(action);
            if (selectorAction && [self respondsToSelector:selectorAction]) {
                IMP imp = [self methodForSelector:selectorAction];
                void (*func)(id, SEL) = (void *)imp;
                func(self, selectorAction);
            }
            *stop = YES;
        }
    }];
    
}

#pragma mark -Action Method

- (void)onWechatPlatfromLoginAction {
    NSLog(@"-------- you login third platform is wechat ---------");
    
}

- (void)onQQPlatfromLoginAction {
    NSLog(@"-------- you login third platform is QQ ---------");
}

- (void)onAlipayPlatfromLoginAction {
    NSLog(@"-------- you login third platform is alipay ---------");
}

- (void)onSinaPlatfromLoginAction {
    NSLog(@"-------- you login third platform is sina ---------");
}

@end
