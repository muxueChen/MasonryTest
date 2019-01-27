//
//  Demo10ViewController.m
//  MasonyTest
//
//  Created by muxue on 2019/1/26.
//  Copyright © 2019 muxue. All rights reserved.
//

#import "Demo10ViewController.h"

@interface Demo10ViewController ()
@property (nonatomic, strong) UIView *animationView;
@end

@implementation Demo10ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo];
}
- (void)createDemo {
    self.animationView = [[UIView alloc] init];
    self.animationView.backgroundColor = UIColor.greenColor;
    //1
    [self.view addSubview:self.animationView];
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.height.mas_equalTo(100);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = UIColor.redColor;
    [button setTitle:@"放大" forState:UIControlStateNormal];
    [button setTitle:@"缩小" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.width.mas_equalTo(100);
    }];
}

- (void)clicked:(UIButton *)btn {
    btn.selected = !btn.selected;
    //2
    [self.animationView setNeedsLayout];
    if (btn.selected) {
        [UIView animateWithDuration:0.25 animations:^{
            [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.height.mas_equalTo(300);
            }];
            //3
            [self.animationView layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.height.mas_equalTo(100);
            }];
            //3
            [self.animationView layoutIfNeeded];
        }];
        
    }
}
@end
