//
//  Demo9ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo9ViewController.h"

@interface Demo9ViewController ()

@end

@implementation Demo9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置宽高比";
    [self createDemo];
}

- (void)createDemo {
    //示例1
    YYLabel *superView = [[YYLabel alloc] init];
    superView.text = @"示例2";
    superView.textAlignment = NSTextAlignmentCenter;
    superView.backgroundColor = UIColor.redColor;
    [self.view addSubview:superView];
    [superView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        //superView.width = superView.height = self.view.width * 0.5;
        make.width.height.mas_equalTo(self.view.mas_width).multipliedBy(0.5);
    }];
    
    //示例2
    YYLabel *subView = [[YYLabel alloc] init];
    subView.text = @"示例2";
    subView.textAlignment = NSTextAlignmentCenter;
    subView.backgroundColor = UIColor.blueColor;
    [superView addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(superView);
        //subView.height = subView.width * 0.5;
        make.height.mas_equalTo(subView.mas_width).multipliedBy(0.5);
    }];
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
