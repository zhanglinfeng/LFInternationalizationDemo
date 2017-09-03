//
//  UIImage+Internationalization.m
//  LFInternationalizationDemo
//
//  Created by 张林峰 on 2017/9/3.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import "UIImage+Internationalization.h"
#import <objc/runtime.h>

@implementation UIImage (Internationalization)

+(void)load {
    Method otherMehtod = class_getClassMethod(self, @selector(swizzled_imageNamed:));
    Method originMehtod = class_getClassMethod(self, @selector(imageNamed:));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (UIImage *)swizzled_imageNamed:(NSString *)name {
    return [self swizzled_imageNamed:NSLocalizedString(name, nil)];
}

@end
