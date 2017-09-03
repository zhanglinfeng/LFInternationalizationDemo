//
//  NSBundle+LF.h
//  LFInternationalizationDemo
//
//  Created by 张林峰 on 2017/9/3.
//  Copyright © 2017年 张林峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (LF)
    
+ (void)setMainBundelLanguage:(NSString *)language;

+ (NSBundle *)getCurrentMainBundel;

@end
