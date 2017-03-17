//
//  PWShowThirdPlatformView1.m
//  PaiWoYa
//
//  Created by Spider-xupeng on 2017/3/3.
//  Copyright © 2017年 spider. All rights reserved.
//

#import "XPShowThirdPlatformView.h"
#import "UIButton+platfromType.h"

@interface XPShowThirdPlatformView ()

@end

@implementation XPShowThirdPlatformView

#pragma mark - initialization
- (instancetype)init {
    self = [super init];
    if (self) {
        return self;
    }
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        return self;
    }
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleColor = [UIColor lightGrayColor];
        _titleFont = 14.0;
        _iconTopEdge = 0;
        _titleTopEdge = 10;
         return self;
    }
    return nil;
}

#pragma mark - Public Method
- (void)setupThirdPlatformItemsWithSize:(CGSize)size space:(CGFloat)space {
    if (self.platformIconGroup.count <= 0 || self.platformIconGroup.count > 4) {
        return;
    }
    CGFloat edgeLeft = (ScreenWidth - space * (self.platformIconGroup.count - 1) - size.width *self.platformIconGroup.count)/2.0;
    [self.platformIconGroup enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *iconName = [[obj allKeys] lastObject];
        NSNumber *PlatformTpye = [obj objectForKey:iconName];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(edgeLeft + (size.width + space) * idx ,_iconTopEdge , size.width, size.height);
        button.platfromType = PlatformTpye;
        [button setBackgroundImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onPlatfromButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
    
    if (self.platformTitleGroup.count <= 0 || self.platformTitleGroup.count > 4) {
        return;
    }
    [self.platformTitleGroup enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *title = [[obj allKeys] lastObject];
        CGSize stringSize = [title boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_titleFont]} context:nil].size;
        UILabel *titleLabel = [UILabel new];
        titleLabel.frame = CGRectMake(edgeLeft + (size.width + space) * idx ,_iconTopEdge + _titleTopEdge + size.height , size.width, stringSize.height);
        titleLabel.text = title;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = _titleColor;
        titleLabel.font = [UIFont systemFontOfSize:_titleFont];
        [self addSubview:titleLabel];
    }];
}

#pragma mark - Action Method
- (void)onPlatfromButtonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(showThirdPlatformView:didSelectPlatformItemWithType:)]) {
        [self.delegate showThirdPlatformView:self didSelectPlatformItemWithType:sender.platfromType.integerValue];
    }
}

#pragma mark - Property
- (NSMutableArray<NSDictionary *> *)platformIconGroup {
    if (!_platformIconGroup) {
        _platformIconGroup = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _platformIconGroup;
}

- (NSMutableArray<NSDictionary *> *)platformTitleGroup {
    if (!_platformTitleGroup) {
        _platformTitleGroup = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _platformTitleGroup;
}

- (void)setIconTopEdge:(CGFloat)iconTopEdge {
    _iconTopEdge = iconTopEdge;
}

- (void)setTitleTopEdge:(CGFloat)titleTopEdge {
    _titleTopEdge = titleTopEdge;
}

- (void)setTitleFont:(CGFloat)titleFont {
    _titleFont = titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
}

@end
