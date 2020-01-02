//
//  ViewController.m
//  DemoTest
//
//  Created by zyy on 2019/11/11.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "ViewController.h"
#import "Preson.h"
#import "NSObject+test.h"
#import "testView.h"
#import "animal.h"
#import <objc/runtime.h>
#import "RACVC.h"
#import "NetVC.h"
#import "sortView.h"
#import "tableViewController.h"
#import "collectionViewController.h"
#import "delegateAndProtocolVC.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"

@interface ViewController ()<suberProtocol>

@property (strong , nonatomic) testView * testV;

@property (strong , nonatomic) Preson * preson;
@property (strong , nonatomic) animal * an;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

-(void)loadView{
    [super loadView];
    NSLog(@"loadView");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)dealloc{
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    char c = 'a';
    NSNumber * number = [NSNumber numberWithChar:c];//这里是ascll码
    
    NSLog(@"number === %@" , number);
    
    CGPoint point = CGPointMake(0, 0);
    
    NSValue * value = [NSValue valueWithCGPoint:point];
    
//    NSDictionary * dict = @{@"point":value};
    
    Preson * pp = [[Preson alloc] initWithAge];
    pp.onlyReadString = @"onlyReadString";
    pp.aaaa = @"aaaa";
    pp.Name = @"zyy";
//    pp.NAME = @"lxx";
    
    NSError * err = nil;
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:pp requiringSecureCoding:YES error:&err];
    if (err) {
        NSLog(@"err == %@" , err);
    }
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:pp];
    
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask , YES).firstObject;
    
    NSLog(@"%@" , [path stringByAppendingPathComponent:@"aaa"]);

    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[path stringByAppendingPathComponent:@"aaa"]]) {
        [fileManager removeItemAtPath:[path stringByAppendingPathComponent:@"aaa"] error:nil];
    }
    
    [data writeToFile:[path stringByAppendingPathComponent:@"aaa"] atomically:YES];
    
    NSData * dataa = [NSData dataWithContentsOfFile:[path stringByAppendingPathComponent:@"aaa"]];
    
    NSError * error = nil;
    Preson * ppp = [NSKeyedUnarchiver unarchivedObjectOfClass:[Preson class] fromData:dataa error:&error];
//    NSMutableSet * set = [[NSMutableSet alloc] init];
//    [set addObject:[Preson class]];
//    Preson * ppp = [NSKeyedUnarchiver unarchivedObjectOfClasses:set fromData:dataa error:&error];
    if (error) {
        NSLog(@"%@" , error);
    }
//    Preson * ppp = [NSKeyedUnarchiver unarchiveObjectWithData:dataa];
    NSLog(@"ppp.Name ==  %@" , ppp.Name );
    NSLog(@"ppp.aaa ==  %@" , ppp.aaaa);
    
//
//    [dict writeToFile:@"" atomically:YES];
//
//    [array writeToFile:@"" atomically:YES];
//
//    [string writeToFile:@"" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
//    NSFileManager * file = [NSFileManager defaultManager];
//
//    if ([file fileExistsAtPath:@""]) {
//        [data writeToFile:@"" atomically:nil];
//    }
    
    [[delegateClassaa share].delegates addObject:self];
    
    sortView * sort = [[sortView alloc] init];
    sort.frame = CGRectMake(300, 400, 100, 100);
    sort.backgroundColor = [UIColor greenColor];
    [self.view addSubview:sort];
    
    
    
//    self.preson = [[Preson alloc] initWithAge];
//
//    [self.preson run];
    
//    self.an = [[animal alloc] init];
    
//    [self.preson setDelegate];
    
//    Preson * preson = [[Preson alloc] init];
//
//    [preson run];
//
//    [preson wocaokaiyangle];
//
//    [Preson wocao];
    
//    testView * view = [[NSBundle mainBundle] loadNibNamed:@"testView" owner:self options:nil].firstObject;
    
    self.testV = [[NSBundle mainBundle] loadNibNamed:@"testView" owner:self options:nil].firstObject;
    
    self.testV.frame = CGRectMake(0, 0, 200, 200);

    [self.view addSubview:self.testV];
    
    UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 250, 150, 40);
    [but setTitle:@"改变testv的frame" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton * racBut = [UIButton buttonWithType:UIButtonTypeCustom];
    racBut.frame = CGRectMake(100, 300, 50, 40);
    [racBut setTitle:@"RAC" forState:UIControlStateNormal];
    [racBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [racBut addTarget:self action:@selector(racClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:racBut];
    
//    [self getProperty];
    
    UIButton * netBut = [UIButton buttonWithType:UIButtonTypeCustom];
    netBut.frame = CGRectMake(100, 400, 50, 40);
    [netBut setTitle:@"Net" forState:UIControlStateNormal];
    [netBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [netBut addTarget:self action:@selector(netClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:netBut];
    
    
    UIButton * tableBut = [UIButton buttonWithType:UIButtonTypeCustom];
    tableBut.frame = CGRectMake(100, 500, 50, 40);
    [tableBut setTitle:@"tableBut" forState:UIControlStateNormal];
    [tableBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tableBut addTarget:self action:@selector(tableButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tableBut];
    
    
    
    UIButton * collectionBut = [UIButton buttonWithType:UIButtonTypeCustom];
    collectionBut.frame = CGRectMake(100, 550, 80, 40);
    [collectionBut setTitle:@"collectionBut" forState:UIControlStateNormal];
    [collectionBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [collectionBut addTarget:self action:@selector(collectionButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionBut];
    
    
    UIButton * delegateBut = [UIButton buttonWithType:UIButtonTypeCustom];
    delegateBut.frame = CGRectMake(200, 550, 80, 40);
    [delegateBut setTitle:@"delegateBut" forState:UIControlStateNormal];
    [delegateBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [delegateBut addTarget:self action:@selector(delegateButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delegateBut];

    UIButton * flutterBut = [UIButton buttonWithType:UIButtonTypeCustom];
    flutterBut.frame = CGRectMake(250, 150, 100, 40);
    [flutterBut setTitle:@"flutterBut" forState:UIControlStateNormal];
    [flutterBut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [flutterBut addTarget:self action:@selector(flutterButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:flutterBut];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)flutterButClick{
    FlutterEngine * engine = [(AppDelegate *)[UIApplication sharedApplication].delegate flutterEngine];
    FlutterViewController * vc = [[FlutterViewController alloc] initWithEngine:engine nibName:@"" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)superProtocolMethod{
    NSLog(@"%s" , __func__);
}

-(void)delegateButClick{
    [self presentViewController:[delegateAndProtocolVC new] animated:YES completion:nil];
}

-(void)collectionButClick{
    
    [self presentViewController:[collectionViewController new] animated:YES completion:nil];

}

-(void)tableButClick{
    
//    [self.navigationController pushViewController:[tableViewController new] animated:YES];
    
    [self presentViewController:[tableViewController new] animated:YES completion:nil];
    
}

-(void)netClick{
    [self presentViewController:[NetVC new] animated:YES completion:nil];
}

-(void)racClick{
    [self presentViewController:[RACVC new] animated:YES completion:nil];
}

-(void)getProperty{
    
    NSMutableDictionary * properts = [NSMutableDictionary new];
    
    unsigned int propertyCount = 0;
    
    objc_property_t * propertyList = class_copyPropertyList([animal class], &propertyCount);
    
    for (unsigned int propertyInt = 0 ; propertyInt < propertyCount; propertyInt ++) {
        objc_property_t property = propertyList[propertyInt];
        NSString * propertyName = @(property_getName(property));//到这一步只是获取了属性的名字， 还可以获取属性的属性，比如类型 比如 原子操作  比如读写权限  
        NSMutableDictionary * propertyAttributes = [NSMutableDictionary new];
        unsigned int attributeCount = 0;
        objc_property_attribute_t * attributeList = property_copyAttributeList(property, &attributeCount);
        for (unsigned int attributeInt = 0; attributeInt< attributeCount; attributeInt++) {
            objc_property_attribute_t attribute = attributeList[attributeInt];
            [propertyAttributes setObject:@(attribute.value) forKey:@(attribute.name)];
        }
        free(attributeList);
        [properts setObject:propertyAttributes forKey:propertyName];
    }
    free(propertyList);
    
    NSLog(@"%@" , properts);
}



-(void)click{
    self.testV.frame = CGRectMake(0, 0, 300, 300);
}


@end
