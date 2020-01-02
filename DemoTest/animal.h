//
//  animal.h
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "delegateClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface animal : NSObject<testDelegate,NSSecureCoding>


//@property (copy , nonatomic) NSString * superString;// T 类型  V 是name  copy 修饰符 "&"  strong 修饰符  N 原子操作 R表示只读
//
//@property (copy , atomic) NSString * NAME;
//
//@property (strong , atomic) NSString * strongName;
//
//@property (strong , nonatomic) NSString * strongNa;
//
@property (copy , nonatomic ) NSString * onlyReadString;
@property (copy , nonatomic , readonly) NSString * aaaa;

//@property (assign , nonatomic) BOOL sex;
//
//@property (strong , nonatomic) NSNumber * age;

//-(void)run;

-(void)setAaaa:(NSString * _Nonnull)aaaa;

-(void)wocaokaiyangle;

+(void)wocao;

-(void)setDelegate;

//-(void)encodeWithCoder:(NSCoder *)coder;
//
//-(nullable instancetype)initWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
