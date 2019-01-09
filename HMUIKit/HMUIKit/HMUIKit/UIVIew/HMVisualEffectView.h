//
//  HMVisualEffectView.h
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 不用在构建实体去传值,通过UIBlurEffectStyle 直接传值
 */
@interface HMVisualEffectView : UIVisualEffectView

/**
 可以去设置style 不用再构建实体
 */
@property(nonatomic)UIBlurEffectStyle setBlueStyle;
- (instancetype)initWithBlurStyle:(UIBlurEffectStyle)blurStyle;
@end
