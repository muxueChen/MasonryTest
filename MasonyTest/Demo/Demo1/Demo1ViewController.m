//
//  Demo1ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo];
}

- (void)createDemo {
    UIView *demoView = [[UIView alloc] init];
    demoView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:demoView];
    [demoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-100);
    }];
    
    //居左上
    YYLabel *leftTopLabel = [[YYLabel alloc] init];
    leftTopLabel.backgroundColor = UIColor.redColor;
    leftTopLabel.text = @"居左上";
    leftTopLabel.textColor = UIColor.whiteColor;
    leftTopLabel.textAlignment = NSTextAlignmentCenter;
    leftTopLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [demoView addSubview:leftTopLabel];
    [leftTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
//
    //居左下
    YYLabel *leftBottomLabel = [[YYLabel alloc] init];
    leftBottomLabel.backgroundColor = UIColor.redColor;
    leftBottomLabel.text = @"居左下";
    leftBottomLabel.textColor = UIColor.whiteColor;
    leftBottomLabel.textAlignment = NSTextAlignmentCenter;
    leftBottomLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [demoView addSubview:leftBottomLabel];
    [leftBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    YYLabel *rightTopLabel = [[YYLabel alloc] init];
    rightTopLabel.backgroundColor = UIColor.redColor;
    rightTopLabel.text = @"居右上";
    rightTopLabel.textColor = UIColor.whiteColor;
    rightTopLabel.textAlignment = NSTextAlignmentCenter;
    rightTopLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [demoView addSubview:rightTopLabel];
    [rightTopLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    //
    //居右下
    YYLabel *rightBottomLabel = [[YYLabel alloc] init];
    rightBottomLabel.backgroundColor = UIColor.redColor;
    rightBottomLabel.text = @"居右下";
    rightBottomLabel.textColor = UIColor.whiteColor;
    rightBottomLabel.textAlignment = NSTextAlignmentCenter;
    rightBottomLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [demoView addSubview:rightBottomLabel];
    [rightBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
    
    //居中
    YYLabel *centerLabel = [[YYLabel alloc] init];
    centerLabel.backgroundColor = UIColor.redColor;
    centerLabel.text = @"居中";
    centerLabel.textColor = UIColor.whiteColor;
    centerLabel.textAlignment = NSTextAlignmentCenter;
    centerLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [demoView addSubview:centerLabel];
    [centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
    }];
}

@end
