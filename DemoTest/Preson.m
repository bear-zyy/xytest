//
//  Preson.m
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "Preson.h"

@interface Preson ()


@end


@implementation Preson

//@synthesize aaaa = _aaaa;

//这个是归档， 是存数据
- (void)encodeWithCoder:(NSCoder *)coder{
    [super encodeWithCoder:coder];
    [coder encodeObject:self.Name forKey:@"Name"];
    
}

//这个是解档， 是取数据
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
//        self.Name = [coder decodeObjectOfClass:[Preson class] forKey:@"Name"];
        self.Name = [coder decodeObjectForKey:@"Name"];
    }
    return self;
    
} // NS_DESIGNATED_INITIALIZER

+(BOOL)supportsSecureCoding{
    return [super supportsSecureCoding];
}

-(void)run{
    NSLog(@"preson mete run");
}

//
//-(id)initWithName{
//    self = [super init];
//    if (self) {
//
//    }
//    return self;
//}

-(instancetype)initWithAge{
    
    self = [super init];
    
    if (self) {
    
    }
    return self;
}

//-(void)testDelegateMethod{
//    NSLog(@"person testDelegateMethod");
//}

//-(void)wocaokaiyangle{
//    [super wocaokaiyangle];
//    NSLog(@"wocaokaiyangle");
//
//    NSLog(@"%@" , self.superString);
//
//}

//+(void)wocao{
//    NSLog(@"可重写");
//}

@end
