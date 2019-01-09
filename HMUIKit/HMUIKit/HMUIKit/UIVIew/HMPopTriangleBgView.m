//
//  HMPopTriangleBgView.m
//  HMUIKit
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMPopTriangleBgView.h"
#define popTriangleHeight 10//三角形高度
#define popTraingleWidth 5//三角形宽度
#define defaultFillColor [UIColor colorWithRed:0 green:0 blue:0 alpha:.5]
#define defaultShadowColor UIColor.clearColor
@interface HMPopTriangleBgView()
@property(nonatomic)HMTriangleDirection triangleDirection;
@property(nonatomic)UIColor * fillColor;
@property(nonatomic)UIColor * shadowColor;
@end
@implementation HMPopTriangleBgView
- (instancetype)initDefaultType
{

    self = [self initWithTriangleDirection:HMTriangleDirectionBoom fillColor:defaultFillColor shadowColor:defaultShadowColor];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}
- (instancetype)initWithTriangleDirection:(HMTriangleDirection)triangleDirection fillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.triangleDirection = triangleDirection;
        self.fillColor = fillColor;
        self.shadowColor = shadowColor;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame direction:(HMTriangleDirection)triangleDirection fillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.triangleDirection = triangleDirection;
        self.fillColor = fillColor;
        self.shadowColor = shadowColor;
    }
    return self;
}
//通过drawRect 画一个 带箭头的气泡框

- (void)drawRect:(CGRect)rect {
    
    [self drawInContext:UIGraphicsGetCurrentContext()];
    self.layer.shadowColor = self.shadowColor?

    self.shadowColor.CGColor:defaultShadowColor.CGColor;
    self.layer.shadowOpacity = .5;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
}

-(void)drawInContext:(CGContextRef)context{
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, self.fillColor?self.fillColor.CGColor:defaultFillColor.CGColor);
    [self getDrawPath:context];
    CGContextFillPath(context);
}
-(void)getDrawPath:(CGContextRef)context{
    
    CGRect rrect = self.bounds;
    
    CGFloat radius = 0;
    
    CGFloat minx = CGRectGetMinX(rrect),
    
    midx = CGRectGetMidX(rrect),
    midy = CGRectGetMidY(rrect),
    maxx = CGRectGetMaxX(rrect);
    
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect);
    
    switch (self.triangleDirection) {
        case HMTriangleDirectionBoom:
        {
            radius =  (rrect.size.height - popTriangleHeight)/2;
            maxy = maxy - popTriangleHeight;
            CGContextMoveToPoint(context, midx+popTraingleWidth, maxy);
            
            CGContextAddLineToPoint(context, midx, maxy+popTriangleHeight);
            
            CGContextAddLineToPoint(context, midx-popTraingleWidth, maxy);
            
            CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
            
            CGContextAddArcToPoint(context, minx, miny, maxx, miny, radius);
            
            CGContextAddArcToPoint(context, maxx, miny, maxx, maxy, radius);
            
            CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);

        }
            break;
        case HMTriangleDirectionTop:
        {
            radius =  (rrect.size.height - popTriangleHeight)/2;
            miny = miny + popTriangleHeight;
            CGContextMoveToPoint(context, midx + popTraingleWidth, miny);
            CGContextAddLineToPoint(context, midx, miny - popTriangleHeight);
            CGContextAddLineToPoint(context, midx - popTraingleWidth,miny);
            CGContextAddArcToPoint(context, minx, miny, minx, maxy, radius);
            CGContextAddArcToPoint(context, minx, maxy, maxx, maxy, radius);
            CGContextAddArcToPoint(context, maxx, maxy, maxx, miny, radius);
            CGContextAddArcToPoint(context, maxx, miny, midx, miny, radius);
        }
            break;
        case HMTriangleDirectionLeft:
        {
            radius = (rrect.size.width - popTriangleHeight)/2;
            minx = minx + popTriangleHeight;
            CGContextMoveToPoint(context, minx, midy +popTraingleWidth);
            CGContextAddLineToPoint(context, minx - popTriangleHeight, midy);
            CGContextAddLineToPoint(context, minx, midy - popTraingleWidth);
            CGContextAddArcToPoint(context, minx, miny, maxx,miny , radius);
            CGContextAddArcToPoint(context, maxx, miny, maxx, maxy, radius);
            CGContextAddArcToPoint(context, maxx, maxy, minx, maxy, radius);
            CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
        }
            break;
        case HMTriangleDirectionRight:
        {
            radius = (rrect.size.width - popTriangleHeight)/2;
            maxx = maxx - popTriangleHeight;
            CGContextMoveToPoint(context, maxx, midy+popTraingleWidth);
            CGContextAddLineToPoint(context, maxx + popTriangleHeight, midy);
            CGContextAddLineToPoint(context, maxx, midy - popTraingleWidth);
            CGContextAddArcToPoint(context, maxx, miny, minx, miny, radius);
            CGContextAddArcToPoint(context, minx, miny, minx, maxy, radius);
            CGContextAddArcToPoint(context, minx, maxy, maxx, maxy, radius);
            CGContextAddArcToPoint(context, maxx, maxy, maxx, midy, radius);
        }
            break;
        default:
            break;
    }
    CGContextClosePath(context);
    
    
}

@end
