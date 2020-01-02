//
//  tableViewController.m
//  DemoTest
//
//  Created by zyy on 2019/12/4.
//  Copyright © 2019 zyy. All rights reserved.
//

#import "tableViewController.h"
#import "cellOne.h"
#import "cellTwo.h"

@interface tableViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

static NSString * cellOneID = @"cellOne";

static NSString * cellTwoID = @"cellTwo";

@implementation tableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.tableView registerClass:[cellOne class] forCellReuseIdentifier:cellOneID];
    
    [self.tableView registerNib:[UINib nibWithNibName:cellTwoID bundle:[NSBundle mainBundle]] forCellReuseIdentifier:cellTwoID];
    
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    cellOne * one = [tableView dequeueReusableCellWithIdentifier:cellOneID forIndexPath:indexPath];
    
    cellTwo * two = [tableView dequeueReusableCellWithIdentifier:cellTwoID forIndexPath:indexPath];
    
//    cellTwo * two = [tableView dequeueReusableCellWithIdentifier:cellTwoID];
//
//    if (!two) {
//        two = [[NSBundle mainBundle] loadNibNamed:cellTwoID owner:self options:nil].firstObject;
////        two = [[cellTwo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellOneID];
//    }
    
    two.label.text = [NSString stringWithFormat:@"%ld" , (long)indexPath.row];
    return two;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46.0;
}


- (IBAction)backClick:(id)sender {

//    [self.navigationController popViewControllerAnimated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
