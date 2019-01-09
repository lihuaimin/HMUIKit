//
//  VibrancyEffectViewController.m
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "VibrancyEffectViewController.h"
#import <Masonry.h>
#import "HMPopViewController.h"
@interface VibrancyEffectViewController ()
@property(nonatomic)UIView * popContentView;
@end

@implementation VibrancyEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton * showNormalPop = [UIButton buttonWithType:UIButtonTypeCustom];
    [showNormalPop setTitle:@"showNormalPop" forState:UIControlStateNormal];
    UIButton * showDarkPop = [UIButton buttonWithType:UIButtonTypeCustom];
    [showDarkPop setTitle:@"showDarkPop" forState:UIControlStateNormal];
    UIButton * showLightPop = [UIButton buttonWithType:UIButtonTypeCustom];
    [showLightPop setTitle:@"showDarkPop" forState:UIControlStateNormal];
    [self.view addSubview:showNormalPop];
    [self.view addSubview:showDarkPop];
    [self.view addSubview:showLightPop];
    [showNormalPop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    [showLightPop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(showNormalPop.mas_bottom).offset(50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    [showDarkPop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(showLightPop.mas_bottom).offset(50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    [showNormalPop addTarget:self action:@selector(showNormalPop) forControlEvents:UIControlEventTouchUpInside];
    [showLightPop addTarget:self action:@selector(showLightPop) forControlEvents:UIControlEventTouchUpInside];
    [showDarkPop addTarget:self action:@selector(showDarkPop) forControlEvents:UIControlEventTouchUpInside];
}
-(void)showNormalPop{
    [HMPopViewController showStyle:HMPopViewControllerStyleNormal location:HMPopViewControllerLocationBoom contentView:self.popContentView inController:self];
}
-(void)showDarkPop{
    [HMPopViewController showStyle:HMPopViewControllerStyleVisualDark location:HMPopViewControllerLocationCenter contentView:self.popContentView inController:self];
}
-(void)showLightPop{
    
    [HMPopViewController showStyle:HMPopViewControllerStyleVisualLark location:HMPopViewControllerLocationTop contentView:self.popContentView inController:self];

}
-(UIView *)popContentView{
    if (!_popContentView) {
        _popContentView = [UIView new];
        UIView * ccc = [UIView new];
        ccc.backgroundColor =  [UIColor blueColor];
        _popContentView.backgroundColor = [UIColor redColor];
        [_popContentView addSubview:ccc];
        [ccc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.popContentView);
            make.width.height.mas_equalTo(50);
            make.top.equalTo(self.popContentView).offset(100);
            make.bottom.equalTo(self.popContentView).offset(-100);
        }];
    }
    return _popContentView;
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
