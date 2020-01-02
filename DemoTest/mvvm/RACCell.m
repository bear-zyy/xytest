//
//  RACCell.m
//  DemoTest
//
//  Created by zyy on 2019/11/19.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "RACCell.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation RACCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    __weak typeof(self) weakSelf = self;
    [RACObserve(self, viewModel.count) subscribeNext:^(id  _Nullable x) {
        weakSelf.label.text = [NSString stringWithFormat:@"%@" , weakSelf.viewModel.count];
    }];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
