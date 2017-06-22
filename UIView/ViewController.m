//
//  ViewController.m
//  UIView
//
//  Created by Aico on 6/21/17.
//  Copyright © 2017 lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%f", [[UIScreen mainScreen] bounds].size.width);
    
    
    // 视图
    UIView *view1 = [[UIView alloc] init];
    // 位置大小
    view1.frame = CGRectMake(100, 100, 50, 50);
    // 背景颜色
    view1.backgroundColor = [UIColor redColor];
    // 将视图加入到父视图中
    [self.view addSubview:view1];
    
    //
    NSLog(@"frame left:%f top:%f width:%f height%f", view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);
    // bounds 边框大小，x y永远是0
    NSLog(@"bounds left:%f top:%f width:%f height:%f", view1.bounds.origin.x, view1.bounds.origin.y, view1.bounds.size.width, view1.bounds.size.height);
    // center 中心点，只有x,y
    NSLog(@"x:%f y:%f", view1.center.x, view1.center.y);
    
    // 父视图
    UIView *superView = view1.superview;
    superView.backgroundColor = [UIColor greenColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 10)];
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"view2";
    label2.textColor = [UIColor whiteColor];
    view2.frame = CGRectMake(30, 100, 100, 100);
    view2.layer.cornerRadius = view2.bounds.size.width / 2;
    // tag是唯一标识,可重复
    view2.tag = 2;
    view2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view2];
    [view2 addSubview:label2];
    
    
    UIView *view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(10, 10, 30, 30);
    view3.tag = 3;
    view3.backgroundColor = [UIColor yellowColor];
    [view2 addSubview:view3];
    
    // 子视图,数组
    NSArray *subViewsArray = view2.subviews;
    for(UIView *view in subViewsArray) {
        view.backgroundColor = [UIColor whiteColor];
        NSLog(@"view3 tag:%ld", view3.tag);
    }
    // 通过tag获取子视图
    UIView *subView = [view2 viewWithTag:3];
    subView.layer.cornerRadius = subView.bounds.size.width / 2;
    
    // 层级的处理
    // 后加的会覆盖前加的
    // 交换层级
    // 当层交换了之后，对应子视图数组下标也会改变
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    // 插入一个视图到指定层
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    view5.backgroundColor = [UIColor yellowColor];
    [view2 insertSubview:view5 atIndex:2];
    // 将一个view放到最顶层或最底层
    [view1 bringSubviewToFront:view3];  // 最顶
    [view1 sendSubviewToBack:view3];    // 最低
    
    // 自适应
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-25, 400, 50, 50);
    backView.backgroundColor = [UIColor orangeColor];
    // 1. 准许自视图自适应
    backView.autoresizesSubviews = YES;
    backView.tag = 1001;
    [self.view addSubview:backView];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(10, 10, 30, 30);
    topView.backgroundColor = [UIColor greenColor];
    // 2. 设置子视图的自适应方式
    // 此处是位或
    topView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [backView addSubview:topView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(10, 550, 355, 30);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // 文本标签 label
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 100, 100, 30);
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"hello";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
//    [label.text sizeWithAttributes:<#(nullable NSDictionary<NSString *,id> *)#>]
    
    // IMAGE VIEW
    // 工程目录路径
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSString *imagePath = [NSString stringWithFormat:@"%@/bg1.png", path];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    // 简单的图片加载方式
    /*
     * 会被加载到内存中
     * 只有关闭程序后才能释放，内存有压力
     * 上面的就不会
     */
    UIImage *image1 = [UIImage imageNamed:@"bg1.png"];
    // 载体：最常见的imageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image1];
    imageView.frame = CGRectMake(30, 300, 300, 300);
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView];
    // 内容模式
    imageView.contentMode = UIViewContentModeCenter;
    
    // UIimageVIew动画，播放序列图
    
    
}

- (void)btnClick {
    UIView *view = [self.view viewWithTag:1001];
    view.frame = CGRectMake(view.frame.origin.x-5, view.frame.origin.y-5, view.frame.size.width+10, view.frame.size.height+10);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
