//
//  cellOne.m
//  DemoTest
//
//  Created by zyy on 2019/12/4.
//  Copyright © 2019 zyy. All rights reserved.
//

#import "cellOne.h"

@implementation cellOne

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.labelOne = [[UILabel alloc] init];
        [self.contentView addSubview:self.labelOne];
        self.labelOne.frame = CGRectMake(100, 0, 100, 30);
        self.labelOne.textColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
