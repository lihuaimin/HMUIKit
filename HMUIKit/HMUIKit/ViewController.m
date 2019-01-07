//
//  ViewController.m
//  HMUIKit
//
//  Created by mac on 2019/1/8.
//  Copyright © 2019 lhm. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableAttributedString+HMSeting.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel * label = [UILabel new];
    
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    NSMutableAttributedString * s = [[NSMutableAttributedString alloc]initWithString:@"我觉得特别的完美"];
    [s addColor:UIColor.orangeColor];
    [s addDeleStyle:NSUnderlineStyleSingle rangeString:@"完美"];
    //    [s addLigature];
//    [s addUnderline];
    label.attributedText = s;
    
}


@end
