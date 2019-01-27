//
//  Demo7ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo7ViewController.h"

@interface Demo7ViewController ()
@property (nonatomic, strong) YYLabel *label1;
@property (nonatomic, strong) UILabel *label2;

@end

@implementation Demo7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo];
}

//普通文本
- (void)createDemo {
    self.label1 = [[YYLabel alloc] init];
    self.label1.text = @"最近是用Masonry自动布局UILabel的时候，;这些东西之后，label还是没有换行。最近是用Masonry自动布局UILabel的时候，";
    self.label1.backgroundColor = UIColor.greenColor;
    self.label1.numberOfLines = 0;
    self.label1.preferredMaxLayoutWidth = self.view.width - 30;
    [self.view addSubview:self.label1];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(15);
        
    }];
    
    self.label2 = [[UILabel alloc]init];
    self.label2.tag = 100;
    [self.view addSubview:self.label2];
    self.label2.text = @"最近是用Masonry自动布局UILabel的时候，;这些东西之后，label还是没有换行。最近是用Masonry自动布局UILabel的时候，";
    self.label2.backgroundColor = UIColor.redColor;
    [self.label2 setPreferredMaxLayoutWidth:self.view.width - 30];
    self.label2.numberOfLines = 0;
    [self.label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label1.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(20);
    }];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"添加文字" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label2.mas_bottom).mas_offset(20);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.width.mas_lessThanOrEqualTo(kScreenWidth);
    }];
    
}
- (void)clicked {
    self.label1.text = [self.label1.text stringByAppendingString:@"Masonry自动布局YYLabel"];
    self.label2.text = [self.label2.text stringByAppendingString:@"Masonry自动布局UILabel"];
}
@end
