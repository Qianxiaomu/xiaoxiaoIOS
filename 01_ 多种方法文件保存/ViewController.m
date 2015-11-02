//
//  ViewController.m
//  01_ 多种方法文件保存
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 lmy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 _dataArr=@[@"CAPISViewController",@"OCAPISViewController",@"UserDefaultViewController"];
    
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource,UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *Identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identify];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = [NSClassFromString(_dataArr[indexPath.row]) new];
    [self.navigationController pushViewController:controller animated:YES
     ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
