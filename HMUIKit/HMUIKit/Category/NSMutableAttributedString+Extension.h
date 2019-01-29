//
//  NSMutableAttributedString+Extension.h
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Extension)
/**
 字体颜色
 
 @param color color
 */
-(void)addColor:(UIColor *)color;
-(void)addColor:(UIColor *)color rangeString:(NSString *)rangeString;

/**
 背景颜色
 
 @param color color
 */
-(void)addBackgroundColor:(UIColor *)color;
-(void)addBackgroundColor:(UIColor *)color rangeString:(NSString *)rangeString;

/**
 下划线
 */
-(void)addUnderline;
-(void)addUnderlineForRangeString:(NSString *)rangeString;

/**
 字体大小
 
 @param font font
 */
-(void)addFont:(UIFont *)font;
-(void)addFont:(UIFont *)font rangeString:(NSString *)rangeString;


/**
 删除线
 
 @param style 删除线样式
 */
-(void)addDeleStyle:(NSUnderlineStyle)style;
-(void)addDeleStyle:(NSUnderlineStyle)style rangeString:(NSString *)rangeString;

@end

NS_ASSUME_NONNULL_END
