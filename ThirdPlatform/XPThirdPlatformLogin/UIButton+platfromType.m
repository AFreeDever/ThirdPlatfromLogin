//
//  UIButton+platfromType.m
//  ThirdPlatform
//
//  Created by Spider-xupeng on 2017/3/17.
//  Copyright © 2017年 Spider123. All rights reserved.
//

#import "UIButton+platfromType.h"
#import <objc/runtime.h>

@implementation UIButton (platfromType)


#pragma mark - Property

- (void)setPlatfromType:(NSNumber *)platfromType {
    objc_setAssociatedObject(self, @selector(platfromType), platfromType , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)platfromType {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark -Public Method

- (void)removeAssociatedObjects {
    objc_removeAssociatedObjects(self);
}

@end
