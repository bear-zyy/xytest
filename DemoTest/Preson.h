//
//  Preson.h
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "animal.h"

NS_ASSUME_NONNULL_BEGIN

@interface Preson : animal<NSSecureCoding>

//-(id)initWithName;

@property (copy , nonatomic ) NSString * Name;

-(instancetype)initWithAge;

//-(void)run;



@end

NS_ASSUME_NONNULL_END
