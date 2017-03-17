//
//  PWShowThirdPlatformView1.h
//  PaiWoYa
//
//  Created by Spider-xupeng on 2017/3/3.
//  Copyright © 2017年 spider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XPThirdPlatformLoginManager.h"

#define ScreenHeigth  [UIScreen mainScreen].bounds.size.height
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width

@class XPShowThirdPlatformView;

@protocol XPShowThirdPlatformViewDelegate <NSObject>

@required
- (void)showThirdPlatformView:(XPShowThirdPlatformView *)thirdPlatformView didSelectPlatformItemWithType:(XPThirdPlatformLoginType)type;

@end

@interface XPShowThirdPlatformView : UIView

@property (nonatomic, weak) id <XPShowThirdPlatformViewDelegate> delegate; // 展示平台View的delegate

@property (nonatomic, strong) NSMutableArray <NSDictionary *> *platformIconGroup; // 平台图标

@property (nonatomic, assign) CGFloat iconTopEdge; // 图标顶部距该视图的间距 默认0.0

@property (nonatomic, assign) CGFloat titleTopEdge; // 标题顶部距图标的间距 默认10.0

@property (nonatomic, strong) NSMutableArray <NSDictionary *> *platformTitleGroup; // 平台标题

@property (nonatomic, assign) CGFloat titleFont; // 字体大小 默认14.0

@property (nonatomic, strong) UIColor *titleColor; // 字体颜色 默认lightGrayColor


/**
 配置各个平台icon的大小，间距
 
 @param size 大小
 @param space 间距
 */
- (void)setupThirdPlatformItemsWithSize:(CGSize)size space:(CGFloat)space;

@end
