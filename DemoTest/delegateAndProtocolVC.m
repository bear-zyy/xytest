//
//  delegateAndProtocolVC.m
//  DemoTest
//
//  Created by zyy on 2019/12/4.
//  Copyright © 2019 zyy. All rights reserved.
//

#import "delegateAndProtocolVC.h"

@implementation delegateClassaa

+(instancetype)share{
    
    static delegateClassaa * class = nil;
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        class = [[delegateClassaa alloc] init];
    });
    return class;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.delegates = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

@end

@interface delegateAndProtocolVC ()

@end

@implementation delegateAndProtocolVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[delegateClassaa share].delegates addObject:self];

    [[[delegateClassaa share].delegates allObjects] enumerateObjectsUsingBlock:^(id<suberProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:@selector(superProtocolMethod)]) {
            [obj superProtocolMethod];
        }
    }];
    
//    if ([[delegateClassaa share].delegate respondsToSelector:@selector(superProtocolMethod)]) {
//        [[delegateClassaa share].delegate superProtocolMethod];
//    }
    
    // Do any additional setup after loading the view.
}

-(void)suberProtocolMethod{
    NSLog(@"%s" , __func__);
}

-(void)protocolMethod{
    NSLog(@"%s" , __func__);
}

-(void)superProtocolMethod{
    NSLog(@"%s" , __func__);
}

@end
