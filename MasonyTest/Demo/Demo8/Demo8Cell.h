//
//  Demo8Cell.h
//  MasonyTest
//
//  Created by muxue on 2018/12/25.
//  Copyright © 2018 muxue. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Demo8Model;
NS_ASSUME_NONNULL_BEGIN

@interface Demo8Cell : UITableViewCell
@property (nonatomic, strong) UILabel *messageLabel;

- (void)setmessage:(Demo8Model *)message;
@end

NS_ASSUME_NONNULL_END
