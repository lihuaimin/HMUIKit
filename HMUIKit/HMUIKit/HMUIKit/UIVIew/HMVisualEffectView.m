//
//  HMVisualEffectView.m
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMVisualEffectView.h"

@implementation HMVisualEffectView

- (instancetype)initWithBlurStyle:(UIBlurEffectStyle)blurStyle
{
    self = [super init];
    if (self) {
        self.setBlueStyle = blurStyle;
    }
    return self;
}
-(void)setSetBlueStyle:(UIBlurEffectStyle)setBlueStyle{
    _setBlueStyle = setBlueStyle;
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:setBlueStyle];
    self.effect = blurEffect;
}
@end
