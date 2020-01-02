//
//  animal.m
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "animal.h"

@interface animal ()

@property (strong , nonatomic) delegateClass * delegate;

@end

@implementation animal

/*
 @property (copy , nonatomic) NSString * superString;// T 类型  V 是name  copy 修饰符 "&"  strong 修饰符  N 原子操作 R表示只读

 @property (copy , atomic) NSString * NAME;

 @property (strong , atomic) NSString * strongName;

 @property (strong , nonatomic) NSString * strongNa;

 @property (copy , nonatomic , readonly) NSString * onlyReadString;

 @property (assign , nonatomic) BOOL sex;

 @property (strong , nonatomic) NSNumber * age;
 **/

-(void)encodeWithCoder:(NSCoder *)coder{
//    [coder encodeObject:self.NAME forKey:@"NAME"];
//    [coder encodeObject:self.strongName forKey:@"strongName"];
//    [coder encodeObject:self.superString forKey:@"superString"];
//    [coder encodeObject:self.strongNa forKey:@"strongNa"];
//    [coder encodeObject:self.onlyReadString forKey:@"onlyReadString"];
//    [coder encodeBool:self.sex forKey:@"sex"];
//    [coder encodeObject:self.age forKey:@"age"];
    [coder encodeObject:self.onlyReadString forKey:@"onlyReadString"];
    [coder encodeObject:self.aaaa forKey:@"aaaa"];
    [coder encodeObject:self.delegate forKey:@"delegate"];
}

-(nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
//        self.NAME = [coder decodeObjectForKey:@"NAME"];
//        self.strongName = [coder decodeObjectForKey:@"strongName"];
//        self.superString = [coder decodeObjectForKey:@"superString"];
//        self.strongNa = [coder decodeObjectForKey:@"strongNa"];
        self.onlyReadString = [coder decodeObjectForKey:@"onlyReadString"];
        self.aaaa = [coder decodeObjectForKey:@"aaaa"];
        self.delegate = [coder decodeObjectForKey:@"delegate"];
//        self.sex = [coder decodeBoolForKey:@"sex"];
//        self.age = [coder decodeObjectForKey:@"age"];
        
    }
    return self;
}

-(void)setAaaa:(NSString * _Nonnull)aaaa{
    _aaaa = aaaa;
}

+(BOOL)supportsSecureCoding{
    return YES;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.delegate = [[delegateClass alloc] init];
//        self.class.delegate = self;
        
//        _aaaa = @"aaaa";
//        _onlyReadString = @"onlyReadString";
    }
    return self;
}

-(void)setDelegate{
    
    
    
}

//-(void)run{
//    NSLog(@"animal run");
//}

-(void)wocaokaiyangle{
    
//    self.superString = @"animal";
    
    NSLog(@"class == %@" , [self class]);
    
    NSLog(@"animal   wocaokaiyangle");
}

+(void)wocao{

    NSLog(@"animal wocao ");
}

-(void)testDelegateMethod{
    NSLog(@" animal  testDelegateMethod");
}

@end
