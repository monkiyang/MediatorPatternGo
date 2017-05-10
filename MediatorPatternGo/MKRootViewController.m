//
//  MKRootViewController.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/9.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKRootViewController.h"

#import "MKMediator+ModuleA.h"
#import "MKMediator+ModuleB.h"
#import "MKMediator+ModuleC.h"

@interface MKRootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation MKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"Mediator Pattern";
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)setupSubviews {
    [self.view addSubview:self.tableView];
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"tableView": _tableView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views]];
}

#pragma mark - Setter && Getter Methods
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    if (row == 0) {
        cell.textLabel.text = @"Module A";
    } else if (row == 1) {
        cell.textLabel.text = @"Module B";
    } else if (row == 2) {
        cell.textLabel.text = @"Module C";
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSInteger row = indexPath.row;
    if (row == 0) {
        UIViewController *viewController = [MKMediator moduleA_viewControllerWithTitle:@"Module A" extraA:@"Extra A"];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if (row == 1) {
        UIViewController *viewController = [MKMediator moduleB_viewControllerWithTitle:@"Module B" extraB:@"Extra B"];
        [self.navigationController pushViewController:viewController animated:YES];
    } else if (row == 2) {
        UIViewController *viewController = [MKMediator moduleC_viewControllerWithTitle:@"Module C" extraC:@"Extra C"];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
