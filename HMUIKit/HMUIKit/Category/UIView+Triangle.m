//
//  UIView+Triangle.m
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "UIView+Triangle.h"

@implementation UIView (Triangle)

-(void)drawRectDefault{
    
    [self drawRectWithFillColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5] shadowColor:UIColor.clearColor triangleHeight:10 triangleWidth:5 direction:HMTriangleDirectionBoom];
    
}
-(void)drawRectWithFillColorDefault:(UIColor *)fillColor{
    [self drawRectWithFillColor:fillColor shadowColor:UIColor.clearColor triangleHeight:10 triangleWidth:5 direction:HMTriangleDirectionBoom];
}
-(void)drawRectWithFillColor:(UIColor *)fillColor shadowColor:(UIColor *)shadowColor triangleHeight:(CGFloat)tHeight triangleWidth:(CGFloat)tWidth direction:(HMTriangleDirection)direction{
    self.layer.shadowColor = shadowColor?shadowColor.CGColor:UIColor.clearColor.CGColor;
    self.layer.shadowOpacity = .5;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, fillColor?fillColor.CGColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.5].CGColor);
    [self drawPath:context triangleHeight:tHeight triangleWidth:tWidth direction:direction];
    CGContextFillPath(context);
}
-(void)drawPath:(CGContextRef)context triangleHeight:(CGFloat)tHeight triangleWidth:(CGFloat)tWidth direction:(HMTriangleDirection)direction{
    CGFloat popTriangleHeight = tHeight;
    CGFloat popTraingleWidth = tWidth;
    CGRect rrect = self.bounds;
    CGFloat radius = 0;
    CGFloat minx = CGRectGetMinX(rrect),
    midx = CGRectGetMidX(rrect),
    midy = CGRectGetMidY(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect);
    switch (direction) {
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
