//
//  delegateClass.h
//  DemoTest
//
//  Created by zyy on 2019/11/20.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol testDelegate <NSObject>

-(void)testDelegateMethod;

@end


@interface delegateClass : NSObject<NSSecureCoding>

@property (copy , nonatomic) NSString * bbbb;

//@property (weak, nonatomic) id <testDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
