//
//  HMPPView.m
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMPPView.h"
#import "UIView+Triangle.h"
@implementation HMPPView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    [self drawRectWithFillColorDefault:UIColor.orangeColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
