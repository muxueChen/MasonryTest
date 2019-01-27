//
//  Demo6ViewController.m
//  MasonyTest
//
//  Created by muxue on 2018/12/24.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo6ViewController.h"

@interface Demo6ViewController ()

@end

@implementation Demo6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"队列等宽";
    [self createDemo];
}

- (void)createDemo {
    NSMutableArray *views = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        YYLabel *item = [[YYLabel alloc] init];
        item.backgroundColor = UIColor.greenColor;
        item.textAlignment = NSTextAlignmentCenter;
        item.text = [NSString stringWithFormat:@"%ld",i];
        [views addObject:item];
        [self.view addSubview:item];
    }
    [views mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
    [views mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                    withFixedItemLength:100
                            leadSpacing:50
                            tailSpacing:50];
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
