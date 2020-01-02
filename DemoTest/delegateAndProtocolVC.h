//
//  delegateAndProtocolVC.h
//  DemoTest
//
//  Created by zyy on 2019/12/4.
//  Copyright © 2019 zyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol superProtocol <NSObject>

@optional
-(void)superProtocolMethod;

@end

@protocol protocol <superProtocol>

@optional
-(void)protocolMethod;

@end

@protocol suberProtocol <protocol>

@optional
-(void)suberProtocolMethod;

@end


@interface delegateClassaa : NSObject

//@property (weak, nonatomic) id <suberProtocol> delegate;

@property (strong , nonatomic) NSHashTable<id <suberProtocol>> * delegates;

+(instancetype)share;

@end

NS_ASSUME_NONNULL_BEGIN

@interface delegateAndProtocolVC : UIViewController <suberProtocol>



@end

NS_ASSUME_NONNULL_END
