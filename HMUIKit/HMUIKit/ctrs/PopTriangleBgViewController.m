//
//  PopTriangleBgViewController.m
//  HMUIKit
//
//  Created by lee on 2019/1/9.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "PopTriangleBgViewController.h"
#import "HMPopTriangleBgView.h"
#import <Masonry.h>
#import "HMPPView.h"
#import "HMPPViView.h"
@interface PopTriangleBgViewController ()

@end

@implementation PopTriangleBgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
//    HMPopTriangleBgView * topbgView = [[HMPopTriangleBgView alloc]initWithTriangleDirection:HMTriangleDirectionTop fillColor:UIColor.orangeColor shadowColor:UIColor.clearColor];
    HMPPView * topbgView = [HMPPView new];
    [self.view addSubview:topbgView];
    [topbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
    HMPopTriangleBgView * leftbgView = [[HMPopTriangleBgView alloc]initWithTriangleDirection:HMTriangleDirectionLeft fillColor:UIColor.orangeColor shadowColor:UIColor.clearColor];
    [self.view addSubview:leftbgView];
    [leftbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(300);
//        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(200);
    }];
    HMPopTriangleBgView * rightbgView = [[HMPopTriangleBgView alloc]initWithTriangleDirection:HMTriangleDirectionRight fillColor:UIColor.orangeColor shadowColor:UIColor.clearColor];
    [self.view addSubview:rightbgView];
    [rightbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(300);
        //        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(200);
    }];
    HMPPViView * boombgView = [HMPPViView new];
    [self.view addSubview:boombgView];
    [boombgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(50);
    }];
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
