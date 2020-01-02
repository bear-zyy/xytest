//
//  Preson+test.m
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "Preson+test.h"

@implementation Preson (test)

+(void)load{
    NSLog(@"Preson     ============= %@" , NSStringFromClass([self class]));
}

-(void)run{
    NSLog(@"Preson + test run");
    
}

@end
