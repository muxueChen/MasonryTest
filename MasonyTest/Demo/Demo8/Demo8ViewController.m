//
//  Demo8ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo8ViewController.h"
#import "Demo8Cell.h"
#import "Demo8Model.h"
@interface Demo8ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<Demo8Model*> *resource;
@end

@implementation Demo8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDemo];
}

- (void)createDemo {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerClass:Demo8Cell.class forCellReuseIdentifier:@"cellID"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

//这些数据是搬别人的，哈哈哈😂
- (NSMutableArray *)resource {
    if (!_resource) {
        NSArray *nameArr = @[@"江短短：",
                             @"扬小小：",
                             @"王调调：",
                             @"陈江：",
                             @"吴梦波："];
        NSArray *messageArr = @[@"ash快点回家爱是妒忌哈市党和国家按时到岗哈时代光华撒国会大厦国会大厦国会大厦更好的噶山东黄金撒旦哈安师大噶是个混蛋撒",
                                @"傲世江湖点撒恭候大驾水草玛瑙现在才明白你个坏蛋擦边沙尘暴你先走吧出现在",
                                @"撒点花噶闪光灯",
                                @"按时间大公司大概好久撒大概好久撒党和国家按时到岗哈师大就萨达数据库化打算几点撒谎就看电视骄傲的撒金葵花打暑假工大撒比的撒谎讲大话手机巴士差距啊市场报价啊山东黄金as擦伤擦啊as擦肩时擦市场报价按时VC阿擦把持啊三重才撒啊双层巴士吃按时吃啊双层巴士擦报啥错",
                                @"as大帅哥大孤山街道安师大好噶时间过得撒黄金国度"];
        _resource = [NSMutableArray array];
        for (int i = 0; i < 30; i++) {
            Demo8Model *model = [[Demo8Model alloc] init];
            model.name = nameArr[arc4random()%nameArr.count];
            model.message = messageArr[arc4random()%messageArr.count];
            model.picNum = arc4random()%9;
            [_resource addObject:model];
        }
    }
    return _resource;
}

#pragma makr - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Demo8Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    [cell setmessage:self.resource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
