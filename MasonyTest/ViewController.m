//
//  ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/23.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "ViewController.h"
#define DEMOVIEWCONTROLLER_CLASS(index) NSClassFromString([NSString stringWithFormat:@"Demo%ldViewController", index])

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *resource;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
//    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.tableView];
}

#pragma mark -- resource
- (NSArray *)resource {
    if (!_resource) {
        _resource = @[@"顶部间距|底部间距|左部间距|右部间距|居上|居下|居左|居右",
                      @"父控件不定宽高，由子控件把父控件给撑开",
                      @"UIScrollerView 中 contentSize 的运用",
                      @"UIScrollerView 横向分页",
                      @"九宫格布局",
                      @"多列等宽",
                      @"YYLabel|UILabel 多行展示",
                      @"tableView 中 cell 高度自适应，支持展开和收起",
                      @"宽高比运用",
                      @"动画的运用"
                      ];
    }
    return _resource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = self.resource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class class = DEMOVIEWCONTROLLER_CLASS(indexPath.row + 1);
    if (class && [class isSubclassOfClass:UIViewController.class]) {
        UIViewController *vc = [[class alloc] init];
        vc.title = self.resource[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        vc.view.backgroundColor = UIColor.whiteColor;
    }
}
@end
