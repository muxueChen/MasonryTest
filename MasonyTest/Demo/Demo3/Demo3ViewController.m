//
//  Demo3ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController ()
@property (nonatomic, weak) UIView *superView;
@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic, weak) MASConstraint *bottom;
@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo];
}

- (void)createDemo {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(self.view).offset(-100);
    }];
    
    UIView *superView = [[UIView alloc] init];
    superView.backgroundColor = UIColor.greenColor;
    [scrollView addSubview:superView];
    [superView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView).with.insets(UIEdgeInsetsZero);
        make.width.mas_equalTo(scrollView);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"增加" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.redColor;
    [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(20);
    }];
    
    self.superView = superView;
    self.bottomView = button;
    //设置 scrollview 的 contentSize
    [self.superView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.bottom = make.bottom.mas_equalTo(self.bottomView.mas_bottom);
    }];
}

static int num = 0;
- (void)action:(UIButton *)button {
    //取消底部约束
    [self.bottom uninstall];
    num += 1;
    YYLabel *view = [[YYLabel alloc] init];
    view.backgroundColor = UIColor.redColor;
    view.text = [NSString stringWithFormat:@"控件%d", num];
    view.textAlignment = NSTextAlignmentCenter;
    view.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [self.superView addSubview:view];

    //给新 view 添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.superView).offset(20);
        make.right.mas_equalTo(self.superView).offset(-20);
        make.height.mas_equalTo(100);
        make.top.mas_equalTo(self.bottomView.mas_bottom).offset(20);
    }];
    
    //记录最下面的 view
    self.bottomView = view;
    
    //设置新的 contentSize
    [self.superView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.bottom = make.bottom.mas_equalTo(self.bottomView.mas_bottom);
    }];
}

@end
