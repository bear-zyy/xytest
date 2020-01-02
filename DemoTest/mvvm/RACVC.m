//
//  RACVC.m
//  DemoTest
//
//  Created by zyy on 2019/11/19.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "RACVC.h"
#import "RACCell.h"
#import "RACViewModel.h"

@interface RACVC ()<UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong , nonatomic) NSMutableArray * dataArray;

@end

static NSString * cellID = @"RACCell";

@implementation RACVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:cellID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellID];
    
    self.dataArray = [NSMutableArray array];
    
    for (int i = 0 ; i< 4; i++) {
        
        RACViewModel * viewModel = [[RACViewModel alloc] initWithModel:[RACModel new]];
        
        [self.dataArray addObject:viewModel];
    }
    
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RACCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil].firstObject;
    }
    cell.viewModel = self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46.0;
}


- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
