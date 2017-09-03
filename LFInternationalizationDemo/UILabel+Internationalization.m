//
//  UILabel+Internationalization.m
//  LFInternationalizationDemo
//
//  Created by 张林峰 on 2017/9/3.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import "UILabel+Internationalization.h"
#import <objc/runtime.h>

@implementation UILabel (Internationalization)

+(void)load {
    SEL originalSelector = @selector(setText:);
    SEL swizzledSelector = @selector(swizzled_setText:);
    Method originMehtod = class_getInstanceMethod([self class], @selector(setText:));
    Method otherMehtod = class_getInstanceMethod([self class], @selector(swizzled_setText:));
    BOOL didAddMethod =
    class_addMethod(self,
                    originalSelector,
                    method_getImplementation(otherMehtod),
                    method_getTypeEncoding(otherMehtod));
    if (didAddMethod) {
        class_replaceMethod(self,
                            swizzledSelector,
                            method_getImplementation(originMehtod),
                            method_getTypeEncoding(originMehtod));
    }
    else {
        // 交换2个方法的实现
        method_exchangeImplementations(otherMehtod, originMehtod);
    }
}

- (void)swizzled_setText:(NSString *)string {
    [self swizzled_setText:NSLocalizedString(string, nil)];
}

@end
