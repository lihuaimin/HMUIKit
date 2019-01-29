//
//  HMPPViView.m
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMPPViView.h"
#import "UIView+Triangle.h"
@implementation HMPPViView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.setBlueStyle = UIBlurEffectStyleDark;
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    for (UIView *subview in self.subviews) {
        NSLog(@"%@",subview);
        [subview drawRectWithFillColorDefault:UIColor.orangeColor];
//        subview.layer.cornerRadius = 30;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
