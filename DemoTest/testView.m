//
//  testView.m
//  DemoTest
//
//  Created by zyy on 2019/11/12.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "testView.h"

@interface testView ()

@property (strong , nonatomic) NSString * testString;



@end

@implementation testView

//-(instancetype)init{
//    self = [super init];
//    if (self) {
//        NSLog(@"instancetype   init");
//    }
//    return self;
//}

//id  是一个对象指针
//-(instancetype)init{// 这个函数是
//    self = [super init];
//    if (self) {
//        NSLog(@"id init");
//    }
//    return self;
//}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"%s" , __func__);
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s" , __func__);
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"%s" , __func__);
    }
    return self;
}

//走到这一步时， self的frame还没有
-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor yellowColor];
    
//    self.redView = [UIView new];
//
//    self.redView.backgroundColor = [UIColor redColor];
//
//    self.redView.frame = CGRectMake(50, 50, self.frame.size.width / 2, self.frame.size.height / 2);
//
//    [self addSubview:self.redView];
    
    NSLog(@"%s" , __func__);
    
    NSLog(@"%@" , self.subviews);
    
}

//这个就是在父视图调用这个方法时， 子视图需要变化时，就在这个回调方法中操作
-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
    
//    self.redView.frame = CGRectMake(50, 50, self.frame.size.width / 2, self.frame.size.height / 2);
    
}

- (IBAction)click1:(id)sender {
    
    NSMutableString * string = [NSMutableString stringWithString:@"test"];
    
    self.testString = string;
    
    NSLog(@"%@" , self.testString);
    
}

- (IBAction)click2:(id)sender {
    
    NSMutableString * string = [NSMutableString stringWithString:@"test"];
    
    self.testString = string;
    
    string = [NSMutableString stringWithString:@"testaaa"];
    
    NSLog(@"%@" , self.testString);
    
}

-(void)dealloc{
    NSLog(@"dealloc");
}

-(void)removeFromSuperview{
    NSLog(@"removeFromSuperview");
}

-(void)drawRect:(CGRect)rect{
    NSLog(@"testView   ===   drawRect");
}



@end
