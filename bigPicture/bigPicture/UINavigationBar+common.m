//
//  UINavigationBar+common.m
//  jianbian
//
//  Created by comma on 16/5/17.
//  Copyright © 2016年 lj. All rights reserved.
//

#import "UINavigationBar+common.h"
#import <objc/runtime.h>

@implementation UINavigationBar (common)

static char alview;

- (void)setAlphaView:(UIView *)alphaView
{
    objc_setAssociatedObject(self, &alview, alphaView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)alphaView
{
   return objc_getAssociatedObject(self, &alview);
}


- (void)alphaNavigationBarView:(UIColor *)color
{
    if (!self.alphaView) {
        
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        
        [self insertSubview:self.alphaView atIndex:0];
    }
    
    [self.alphaView setBackgroundColor:color];
    
    
}


@end
