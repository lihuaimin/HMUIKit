//
//  HMPopTriangleBgView.m
//  HMUIKit
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMPopTriangleBgView.h"
#define popTriangleHeight 10
#define defaultFillColor [UIColor colorWithRed:0 green:0 blue:0 alpha:.5]
#define defaultShadowColor UIColor.clearColor
@interface HMPopTriangleBgView()
@property(nonatomic)HMTriangleDirection triangleDirection;
@property(nonatomic)UIColor * fillColor;
@property(nonatomic)UIColor * shadowColor;
@end
@implementation HMPopTriangleBgView

- (instancetype)initWithTriangleDirection:(HMTriangleDirection)triangleDirection fillColor:(UIColor *)fillColor
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.blackColor;
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame direction:(HMTriangleDirection)triangleDirection fillColor:(UIColor *)fillColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.blackColor;
    }
    return self;
}
//通过drawRect 画一个 带箭头的气泡框

- (void)drawRect:(CGRect)rect {
    
    [self drawInContext:UIGraphicsGetCurrentContext()];
    
//    self.layer.shadowColor = [[UIColor redColor] CGColor];
    
//    self.layer.shadowOpacity = 1.0;
    
//    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
}

-(void)drawInContext:(CGContextRef)context{
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    [self getDrawPath:context];
    
    CGContextFillPath(context);
    
}

-(void)getDrawPath:(CGContextRef)context{
    
    CGRect rrect = self.bounds;
    
    CGFloat radius = 0;
    
    CGFloat minx = CGRectGetMinX(rrect),
    
    midx = CGRectGetMidX(rrect),
    
    maxx = CGRectGetMaxX(rrect);
    
    CGFloat miny = CGRectGetMinY(rrect),
    
    maxy = CGRectGetMaxY(rrect)-10;
    
    CGContextMoveToPoint(context, midx+10, maxy);
    
    CGContextAddLineToPoint(context, midx, maxy+10);
    
    CGContextAddLineToPoint(context, midx-10, maxy);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    
    CGContextAddArcToPoint(context, minx, miny, maxx, miny, radius);
    
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxy, radius);
    
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    
    CGContextClosePath(context);
    
}

@end
