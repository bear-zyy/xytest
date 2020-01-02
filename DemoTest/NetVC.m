//
//  NetVC.m
//  DemoTest
//
//  Created by zyy on 2019/11/22.
//  Copyright © 2019年 zyy. All rights reserved.
//

#import "NetVC.h"
#import <SDWebImage/SDWebImage.h>

@interface NetVC ()<NSURLSessionDelegate , NSURLSessionDataDelegate , NSURLSessionTaskDelegate >

@end

@implementation NetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 100, 100, 100);
    [but setTitle:@"back" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    [self.view addSubview:imageV];
    [imageV sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    [self request];
}

-(void)request{
    
    NSURL * url = [NSURL URLWithString:@"http://sh.xiaokongping.com/api/v1/login"];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:5];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"content-Type"];
    [request setValue:@"xiaomi" forHTTPHeaderField:@"device"];
    [request setValue:@"8.0" forHTTPHeaderField:@"version"];
    [request setValue:@"iOS" forHTTPHeaderField:@"xy-platform"];
    [request setValue:@"appStore" forHTTPHeaderField:@"xy-channel"];
    [request setValue:@"iPhone11" forHTTPHeaderField:@"xy-device"];
    [request setValue:@"com.xinyue.mua" forHTTPHeaderField:@"xy-id"];
    [request setValue:@"2.5.0" forHTTPHeaderField:@"xy-version"];

    request.HTTPMethod = @"POST";
    
    NSDictionary * dict = @{@"username":@"13520592875" , @"vertify":@"123" , @"type":@"1"};
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    
    request.HTTPBody = data;
    
    NSURLSession * sharedSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    
//    NSURLSessionDataTask * task = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//        if (error) {
//            NSLog(@"%@" , error);
//        }
//        else{
//            id  dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//
//            NSLog(@"block \n %@" , dict);
//        }
//    }];
    
    NSURLSessionDataTask * task = [sharedSession dataTaskWithRequest:request];//这种需要设置代理  设置代理后， 多个请求，都走代理方法， 只能用task来表示不同的请求，这时需要用task的id来区分
    
    [task resume];
    
}

- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data{
    
    id  dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog(@"delegate \n%@" , dict);
    
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"didCompleteWithError");
}


-(void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
