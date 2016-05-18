//
//  UINavigationBar+common.h
//  jianbian
//
//  Created by comma on 16/5/17.
//  Copyright © 2016年 lj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (common)

@property (nonatomic,strong) UIView *alphaView;

//在navigationbar上添加一个view
- (void)alphaNavigationBarView:(UIColor *)color;

@end
