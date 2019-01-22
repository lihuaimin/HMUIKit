//
//  ViewController.m
//  HMUIKit
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "ViewController.h"
//#import "NSMutableAttributedString+HMSeting.h"
//#import <Masonry.h>
//#import "HMPopTriangleBgView.h"
#import <Masonry.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,strong)NSMutableArray  * dataArrs;
@property(nonatomic)UIView * bgView;
@end

@implementation ViewController
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = UIColor.redColor;
        [self.view addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.height.mas_equalTo(100);
        }];
    }
    return _bgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"动画" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.right.equalTo(self.view);
    }];
    [button addTarget:self action:@selector(makeAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self bgView];
//    [self.tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    [self makeData];
}
-(void)makeAnimation{
    [self fadeAnimation];
//    [self fadeAnimation];
}
-(void)colorAnimation{
    
}
-(void)fadeAnimation{
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = .7;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    
    
    
    CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[scaleAnimation];
    animationGroup.duration = .7;
    [self.bgView.layer addAnimation:animationGroup forKey:@"groupAnimation"];
}
-(void)makeData{
    [self.dataArrs addObject:@{@"高德地图弹出泡泡背景view":@"PopTriangleBgViewController"}];
    [self.dataArrs addObject:@{@"毛玻璃效果":@"VibrancyEffectViewController"}];
    [self.tbView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArrs.count;
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary * dic = self.dataArrs[indexPath.row];
    cell.textLabel.text = [[dic allKeys] firstObject];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = self.dataArrs[indexPath.row];
    Class ctrclass = NSClassFromString(dic[[[dic allKeys] firstObject]]);
    [self.navigationController pushViewController:[ctrclass new] animated:YES];
}
-(UITableView *)tbView{
    if (!_tbView) {
        _tbView = [UITableView new];
        [self.view addSubview:_tbView];
        _tbView.delegate = self;
        _tbView.dataSource = self;
        [_tbView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _tbView;
}
-(NSMutableArray *)dataArrs{
    if (!_dataArrs) {
        _dataArrs = [NSMutableArray new];
    }
    return _dataArrs;
}

@end
