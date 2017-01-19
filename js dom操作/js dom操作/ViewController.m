//
//  ViewController.m
//  js dom操作
//
//  Created by 黄建国 on 2017/1/19.
//  Copyright © 2017年 黄建国. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *web;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadWeb];
}


- (void)loadWeb{

    self.web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.web.delegate = self;
    [self.view addSubview:self.web];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.weather.com.cn/index/zxqxgg1/wlstyb.shtml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.web loadRequest:request];
}


//加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *strr = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];

    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    lab.text = strr;
    lab.numberOfLines = 0;
    lab.textAlignment = NSTextAlignmentLeft;
    lab.font = [UIFont systemFontOfSize:12];
    lab.textColor = [UIColor blackColor];
    [self.view addSubview:lab];
    self.web.alpha = 0;
}
@end
