//
//  PWThirdPlatformLoginManager.h
//  PaiWoYa
//
//  Created by Spider-xupeng on 2017/2/27.
//  Copyright © 2017年 spider. All rights reserved.
//  关于第三方登录，只封装了比较常见的四种登录方式（QQ, 微信, 支付宝，新浪微博）,其中关于QQ,微信，微博 这三种登录方式用的友盟的第三方登录（获取用户的第三方平台信息，具体的集成友盟请参考友盟开发文档http://dev.umeng.com/social/ios/operation#7），其中支付宝登录（请参考支付宝开发文档https://doc.open.alipay.com/doc2/apiList?docType=4),具体的如有其他比较常用第三方登录方式，以后再进行添加。本人水平有限，代码如有问题，希望指出。

#import <Foundation/Foundation.h>
//#import <UMSocialCore/UMSocialCore.h>
//#import <AlipaySDK/AlipaySDK.h>

typedef NS_ENUM(NSInteger, XPThirdPlatformLoginType) {
    XPThirdPlatformLoginTypeWechat = 0, // 微信
    XPThirdPlatformLoginTypeQQ, // QQ
    XPThirdPlatformLoginTypeAlipay, // 支付宝
    XPThirdPlatformLoginTypeSina, // 新浪
};

typedef void(^XPThirdPlatformloginCompletion)(id result, id error); // 登录操作完成后的block

@interface XPThirdPlatformLoginManager : NSObject

//@property (nonatomic, assign) XPThirdPlatformLoginType loginTpye; // 登录平台类型

@property (nonatomic, copy) NSString *urlString; // 需要获得支付宝加密参数info的urlString

/**
 第三方登录

 @param platfromType 平台类型（微信, QQ, 支付宝(原生), 新浪）
 @param completion 完成的回调
 */
// 支付宝授权登录(原生登录) 注:web登录直接调用各个app与服务器商定的接口，在此不做封装

- (void)thirdPlatformLoginWithPlatformType:(XPThirdPlatformLoginType)platfromType completion:(XPThirdPlatformloginCompletion)completion;

 @end
