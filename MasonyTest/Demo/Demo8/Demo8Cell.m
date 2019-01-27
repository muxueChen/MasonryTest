//
//  Demo8Cell.m
//  MasonyTest
//
//  Created by muxue on 2018/12/25.
//  Copyright © 2018 muxue. All rights reserved.
//

#import "Demo8Cell.h"
#import "Demo8Model.h"

@interface Demo8Cell ()
@property (nonatomic, strong) UIView *picContentView;
@property (nonatomic, strong) UIView *timerView;
@property (nonatomic, strong) UIView *likeView;
@end

@implementation Demo8Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.numberOfLines = 0;
    [self.contentView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    self.picContentView = [[UIView alloc]init];
    self.picContentView.backgroundColor = UIColor.grayColor;
    [self.contentView addSubview:self.picContentView];
    [self.picContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.messageLabel.mas_bottom).offset(15);
        make.left.mas_offset(50);
        make.right.mas_offset(-20);
    }];
    
    self.timerView = [[UIView alloc]init];
    self.timerView.backgroundColor = UIColor.redColor;
    [self.contentView addSubview:self.timerView];
    [self.timerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.picContentView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(50);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(50);
        make.bottom.mas_equalTo(-8);
    }];
    
    self.likeView = [[UIView alloc] init];
    self.likeView.backgroundColor = UIColor.redColor;
    [self.contentView addSubview:self.likeView];
    [self.likeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.picContentView.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(50);
    }];
}
- (void)setmessage:(Demo8Model *)message {
    // 创建一个可变属性字符串
    NSMutableAttributedString *finalStr = [[NSMutableAttributedString alloc] init];
    
    // 创建姓名
    NSAttributedString *nameStr = [[NSAttributedString alloc] initWithString:message.name attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor redColor]}];
    
    // 创建发言内容
    NSAttributedString *messageStr = [[NSAttributedString alloc] initWithString:message.message attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    // 拼接上两个字符串
    [finalStr appendAttributedString:nameStr];
    [finalStr appendAttributedString:messageStr];
    self.messageLabel.attributedText = finalStr;
    //移除所有图片
    [self.picContentView removeAllSubviews];
    [self createDemo:message.picNum];
}

- (void)createDemo:(NSInteger)itemNum {
    //假设要显示 num 个item
    NSInteger num = itemNum;
    //每行显示的个数
    NSInteger count = 3;
    //显示的总行数
    NSInteger rowNum = (num/count) + ((NSInteger)(num%count>0));
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
            [self.picContentView addSubview:view];
            [masonryViewArray addObject:view];
            lastView = view;
        }
        // 固定 item 之间的间距，item 的宽或者高自动缩放
        [masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
        // 设置array的垂直方向的约束
        [masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@((100 * i) + 10));
            make.height.equalTo(@80);
        }];
    }
    if (lastView) {
        [self.picContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(lastView.mas_bottom).mas_offset(20);
        }];
    }
}
@end
