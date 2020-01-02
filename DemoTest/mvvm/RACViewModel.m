//
//  RACViewModel.m
//  DemoTest
//
//  Created by zyy on 2019/11/19.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "RACViewModel.h"

@implementation RACViewModel

//比如点赞  我就可以放到这里来操作了 就是说，如果view的展示状态，是需要model的状态来控制，最好用MVVM，如果是view的UI自己可以控制，到无所谓了
-(instancetype)initWithModel:(RACModel *)model{
    self = [super init];
    _model = model;
    if (self) {
        
    }
    return self;
}

-(void)change{
    
    NSLog(@"执行了吗？");
    
    self.count = @(self.count.intValue + 1);
    
}


@end
