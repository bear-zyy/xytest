//
//  delegateClass.m
//  DemoTest
//
//  Created by zyy on 2019/11/20.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "delegateClass.h"

@implementation delegateClass

-(void)encodeWithCoder:(NSCoder *)coder{
//    [coder encodeObject:self.delegate forKey:@"delegate"];
    [coder encodeObject:self.bbbb forKey:@"bbbb"];
}
-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if (self) {
        self.bbbb = [coder decodeObjectForKey:@"bbbb"];
//        self.delegate = [coder decodeObjectForKey:@"delegate"];
    }
    return self;
}

+(BOOL)supportsSecureCoding{
    return YES;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.bbbb = @"bbbb";
//        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(change) userInfo:nil repeats:YES];
        
        
    }
    return self;
}

-(void)change{
    
//    if ([self.delegate respondsToSelector:@selector(testDelegateMethod)]) {
    
    
//        [self.delegate testDelegateMethod];
    
    
//    }
    
}

@end
