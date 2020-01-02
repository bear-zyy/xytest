//
//  testView.h
//  DemoTest
//
//  Created by zyy on 2019/11/12.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface testView : UIView

@property (strong , nonatomic) UIView * redView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

NS_ASSUME_NONNULL_END
