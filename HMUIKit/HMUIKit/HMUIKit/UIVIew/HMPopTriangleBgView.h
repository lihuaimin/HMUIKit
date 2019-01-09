//
//  HMPopTriangleBgView.h
//  HMUIKit
//
//  Created by mac on 2019/1/8.
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
 高度宽度需要大于popTriangleHeight 默认10
 */
@interface HMPopTriangleBgView : UIView
- (instancetype)initDefaultType;
- (instancetype)initWithTriangleDirection:(HMTriangleDirection)triangleDirection fillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor;
@property(nonatomic,assign)CGFloat bgRadio;
@end

NS_ASSUME_NONNULL_END
