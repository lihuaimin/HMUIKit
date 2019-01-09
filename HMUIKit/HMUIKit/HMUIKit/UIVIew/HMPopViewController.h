//
//  HMPopViewController.h
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, HMPopViewControllerStyle){
    HMPopViewControllerStyleNormal = 0,
    HMPopViewControllerStyleVisualLark,
    HMPopViewControllerStyleVisualDark
    
};
typedef NS_OPTIONS(NSUInteger, HMPopViewControllerLocation) {
    HMPopViewControllerLocationCenter,
    HMPopViewControllerLocationBoom,
    HMPopViewControllerLocationTop
};
@interface HMPopViewController : UIViewController

/**
 弹出一个由下而上的弹窗

 @param popStyle popStyle description
 @param location location description
 @param contentView contentView description
 @param inCtr inCtr description
 */
+(void)showStyle:(HMPopViewControllerStyle)popStyle location:(HMPopViewControllerLocation)location contentView:(UIView *)contentView inController:(UIViewController *)inCtr;

@end
