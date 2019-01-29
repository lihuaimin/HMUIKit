//
//  UIView+Triangle.h
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, HMTriangleDirection){
    HMTriangleDirectionBoom = 0,
    HMTriangleDirectionTop,
    HMTriangleDirectionLeft,
    HMTriangleDirectionRight
};
NS_ASSUME_NONNULL_BEGIN

/**
 倒三角 给其frame或者drawRect里的方法
 */
@interface UIView (Triangle)
-(void)drawRectDefault;
-(void)drawRectWithFillColorDefault:(UIColor *)fillColor;
-(void)drawRectWithFillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor triangleHeight:(CGFloat)tHeight triangleWidth:(CGFloat)tWidth direction:(HMTriangleDirection)direction;
@end

NS_ASSUME_NONNULL_END
