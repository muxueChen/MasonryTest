//
//  Demo8Model.h
//  MasonyTest
//
//  Created by muxue on 2018/12/25.
//  Copyright © 2018 muxue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Demo8Model : NSObject
/** 名字 */
@property(nonatomic, copy) NSString *name;
/** 文字内容部分 */
@property(nonatomic, copy) NSString *message;
/** 照片数量 */
@property(nonatomic, assign) NSInteger picNum;
@end

NS_ASSUME_NONNULL_END
