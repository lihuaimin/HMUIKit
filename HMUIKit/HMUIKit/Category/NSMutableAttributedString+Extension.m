//
//  NSMutableAttributedString+Extension.m
//  HMUIKit
//
//  Created by lee on 2019/1/24.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"

@implementation NSMutableAttributedString (Extension)
-(void)addColor:(UIColor *)color{
    [self addColor:color rangeString:self.string];
}
-(void)addColor:(UIColor *)color rangeString:(NSString *)rangeString{
    [self addAttribute:NSForegroundColorAttributeName value:color range:[self.string rangeOfString:rangeString]];
}
-(void)addBackgroundColor:(UIColor *)color{
    [self addBackgroundColor:color rangeString:self.string];
}
- (void)addBackgroundColor:(UIColor *)color rangeString:(NSString *)rangeString{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:[self.string rangeOfString:rangeString]];
}
-(void)addUnderline{
    [self addUnderlineForRangeString:self.string];
}
- (void)addUnderlineForRangeString:(NSString *)rangeString{
    [self addAttribute:NSUnderlineStyleAttributeName value:@1 range:[self.string rangeOfString:rangeString]];
    
}
-(void)addFont:(UIFont *)font{
    [self addFont:font rangeString:self.string];
}
-(void)addFont:(UIFont *)font rangeString:(NSString *)rangeString{
    [self addAttribute:NSFontAttributeName value:font range:[self.string rangeOfString:rangeString]];
}
-(void)addDeleStyle:(NSUnderlineStyle)style{
    
    [self addDeleStyle:style rangeString:self.string];
}

-(void)addDeleStyle:(NSUnderlineStyle)style rangeString:(NSString *)rangeString{
    [self addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:[self.string rangeOfString:rangeString]];
}
@end
