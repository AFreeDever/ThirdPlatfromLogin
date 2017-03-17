//
//  UIButton+platfromType.h
//  ThirdPlatform
//
//  Created by Spider-xupeng on 2017/3/17.
//  Copyright © 2017年 Spider123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (platfromType)

@property (nonatomic, strong) NSNumber *platfromType; // 平台类型

- (void)removeAssociatedObjects; // 移除关联属性

@end
