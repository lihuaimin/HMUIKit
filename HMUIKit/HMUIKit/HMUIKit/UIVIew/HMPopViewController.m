//
//  HMPopViewController.m
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "HMPopViewController.h"
#import "HMVisualEffectView.h"
#import <Masonry.h>
@interface HMPopViewController ()
@property(nonatomic)HMPopViewControllerStyle ctrStyle;
@property(nonatomic)HMPopViewControllerLocation locationStyle;
@property(nonatomic)UIView * contentView;
@property(nonatomic)UIView * bgView;
@property(nonatomic)UIView * contentBgView;
@end

@implementation HMPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+(void)showStyle:(HMPopViewControllerStyle)popStyle location:(HMPopViewControllerLocation)location contentView:(UIView *)contentView inController:(UIViewController *)inCtr{
    HMPopViewController * popCtr = [[self alloc]init];
    popCtr.ctrStyle = popStyle;
    popCtr.locationStyle = location;
    popCtr.contentView = contentView;
    popCtr.modalPresentationStyle = UIModalPresentationOverFullScreen;
    popCtr.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [inCtr presentViewController:popCtr animated:NO completion:^{
        __strong typeof(popCtr)strongCtr = popCtr;
        [strongCtr makeUI];
    }];
}
-(void)makeUI{
    if (self.ctrStyle == HMPopViewControllerStyleNormal) {
        [self makeNormal];
    }
    if (self.ctrStyle == HMPopViewControllerStyleVisualDark || self.ctrStyle == HMPopViewControllerStyleVisualLark) {
        [self makeVisual];
    }
}
-(void)makeNormal{
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    self.bgView = self.view;
    [self addContentView];
}

-(void)makeVisual{
    self.view.backgroundColor = [UIColor clearColor];
    UIBlurEffectStyle blueStyle = UIBlurEffectStyleLight;
    if (self.ctrStyle == HMPopViewControllerStyleVisualDark) {
        blueStyle = UIBlurEffectStyleDark;
    }
    HMVisualEffectView * visView = [[HMVisualEffectView alloc]initWithBlurStyle:blueStyle];
    [self.view addSubview:visView];
    [visView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.bgView = visView;
    [self addContentView];
}
-(void)addContentView{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self.view addGestureRecognizer:tap];
    UITapGestureRecognizer * nothingTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nothing)];
    [self.contentBgView addGestureRecognizer:nothingTap];
    self.contentBgView = [UIView new];
    self.contentBgView.backgroundColor = [UIColor clearColor];
    if ([self.bgView isKindOfClass:[HMVisualEffectView class]]) {
        HMVisualEffectView * visView = (HMVisualEffectView *)self.bgView;
        [visView.contentView addSubview:self.contentBgView];
    }else{
        [self.bgView addSubview:self.contentBgView];
    }
    [self.contentBgView addSubview:self.contentView];
    
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(self.bgView);
        if (self.locationStyle == HMPopViewControllerLocationBoom) {
            make.bottom.equalTo(self.bgView).offset(2000);//MaxFloat没有动画效果
        }
        if (self.locationStyle == HMPopViewControllerLocationCenter) {
            make.center.equalTo(self.bgView).offset(2000);
        }
        if (self.locationStyle == HMPopViewControllerLocationTop) {
            make.top.equalTo(self.bgView).offset(2000);
        }
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
   
    [self startAnimation];
}
-(void)endAnimation{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
   
}
-(void)startAnimation{
    [self.view layoutIfNeeded];
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:.3 animations:^{
        __strong typeof(self)ws = self;
        [ws.contentBgView mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.locationStyle == HMPopViewControllerLocationBoom) {
                make.bottom.equalTo(ws.bgView);
                
            }
            if (self.locationStyle == HMPopViewControllerLocationCenter) {
                make.center.equalTo(self.bgView);
            }
            if (self.locationStyle == HMPopViewControllerLocationTop) {
                make.top.equalTo(self.bgView);
            }
        }];
        [ws.contentBgView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
       

    }];
  
}
-(void)nothing{
    
}
-(void)dismiss{
    [self endAnimation];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
