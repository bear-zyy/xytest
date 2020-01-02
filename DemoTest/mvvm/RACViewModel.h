//
//  RACViewModel.h
//  DemoTest
//
//  Created by zyy on 2019/11/19.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACViewModel : NSObject

@property (strong , nonatomic) NSNumber * count;

-(instancetype)initWithModel:(RACModel *)model;

@property (strong , nonatomic) RACModel * model;

@end

NS_ASSUME_NONNULL_END
