//
//  Demo5ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo5ViewController.h"

//随机颜色
CG_INLINE UIColor * randomColor() {
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@interface Demo5ViewController ()

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo4:64];
}

//可以适配横屏和竖屏，同时保证不同屏宽适配
- (void)createDemo1 {
    //初始化容器控件
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(self.view.mas_width).offset(-50);
    }];
    
    for (int i = 0; i < 3; i ++) {
        NSMutableArray *masonryViewArray = [NSMutableArray array];
        for (int j = 0; j < 3; j ++) {
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor redColor];
            [contentView addSubview:view];
            [masonryViewArray addObject:view];
        }
        // 实现masonry水平固定间隔方法
        [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
        // 设置array的垂直方向的约束
        [masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@((100 * i)+50));
            make.height.equalTo(@80);
        }];
    }
}

//九宫格，不固定个数
- (void)createDemo3:(NSInteger)itemNum {
    //假设要显示 num 个item
    NSInteger num = itemNum;
    //每行显示的个数
    NSInteger count = 3;
    //显示的总行数
    NSInteger rowNum = (num/count) + ((NSInteger)(num%count>0));
    //初始化容器控件
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).offset(-50);
    }];
    UIView *lastView = nil;
    for (int i = 0; i < rowNum; i ++) {
        NSMutableArray *masonryViewArray = [NSMutableArray array];
        for (int j = 0; j < count; j ++) {
            UIView *view = [[UIView alloc] init];
            if ((i * count) + j > num-1) {
                view.backgroundColor = [UIColor clearColor];
            } else {
                view.backgroundColor = [UIColor redColor];
            }
            [contentView addSubview:view];
            [masonryViewArray addObject:view];
            lastView = view;
        }
        // 固定 item 之间的间距，item 的宽或者高自动缩放
        [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
        // 设置array的垂直方向的约束
        [masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@((100 * i)+20));
            make.height.equalTo(@80);
        }];
    }
    if (lastView) {
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(lastView.mas_bottom).mas_offset(20);
        }];
    }
}
//九宫格搭配 scrollView
- (void)createDemo4:(NSInteger)itemNum {
    //假设要显示 num 个item
    NSInteger num = itemNum;
    //每行显示的个数
    NSInteger count = 3;
    //显示的总行数
    NSInteger rowNum = (num/count) + ((NSInteger)(num%count>0));
    
    //首先，有一个可滑动的容器
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(self.view).offset(-100);
    }];
    
    //所承载所有 item 的容器控件
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = UIColor.greenColor;
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(scrollView);
    }];
    UIView *lastView = nil;
    for (int i = 0; i < rowNum; i ++) {
        NSMutableArray *masonryViewArray = [NSMutableArray array];
        for (int j = 0; j < count; j ++) {
            UILabel *view = [[UILabel alloc] init];
            if ((i * count) + j > num-1) {
                view.backgroundColor = [UIColor clearColor];
            } else {
                view.backgroundColor = [UIColor redColor];
                view.text = [NSString stringWithFormat:@"number %ld", (i*count + j)];
            }
            [contentView addSubview:view];
            [masonryViewArray addObject:view];
            lastView = view;
        }
        // 固定 item 之间的间距，item 的宽或者高自动缩放
        [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
        // 设置array的垂直方向的约束
        [masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@((100 * i)+20));
            make.height.equalTo(@80);
        }];
    }
    if (lastView) {
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(lastView.mas_bottom).mas_offset(20);
        }];
    }
}
@end
