//
//  RACCell.h
//  DemoTest
//
//  Created by zyy on 2019/11/19.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACCell : UITableViewCell

@property (strong , nonatomic) RACViewModel * viewModel;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

NS_ASSUME_NONNULL_END
