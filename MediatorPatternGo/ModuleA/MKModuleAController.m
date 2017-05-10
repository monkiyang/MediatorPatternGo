//
//  MKModuleAController.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/9.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleAController.h"

#import "MKMediator+ModuleB.h"
#import "MKMediator+ModuleC.h"

@interface MKModuleAController ()
@property (nonatomic, strong) UIButton *moduleBButton;
@property (nonatomic, strong) UIButton *moduleCButton;

@property (nonatomic, copy) NSString *theTitle;
@end

@implementation MKModuleAController

- (instancetype)initWithTitle:(NSString *)title extraA:(NSString *)extraA {
    if (self = [super init]) {
        _theTitle = title;
    }
    return self;
}

- (void)loadView {
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _theTitle;
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)setupSubviews {
    [self.view addSubview:self.moduleBButton];
    [self.view addSubview:self.moduleCButton];
    
    _moduleBButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"topGuide": self.topLayoutGuide ,@"moduleBButton": _moduleBButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleBButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][moduleBButton(44.)]" options:0 metrics:nil views:views]];
    
    _moduleCButton.translatesAutoresizingMaskIntoConstraints = NO;
    views = @{@"moduleBButton": _moduleBButton, @"moduleCButton": _moduleCButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleCButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[moduleBButton][moduleCButton(44.)]" options:0 metrics:nil views:views]];
}

#pragma mark - Setter && Getter Methods
- (UIButton *)moduleBButton {
    if (!_moduleBButton) {
        _moduleBButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moduleBButton.exclusiveTouch = YES;
        
        [_moduleBButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moduleBButton setTitle:@"Module B" forState:UIControlStateNormal];
        [_moduleBButton addTarget:self action:@selector(moduleBButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moduleBButton;
}

- (UIButton *)moduleCButton {
    if (!_moduleCButton) {
        _moduleCButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moduleCButton.exclusiveTouch = YES;
        
        [_moduleCButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moduleCButton setTitle:@"Module C" forState:UIControlStateNormal];
        [_moduleCButton addTarget:self action:@selector(moduleCButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moduleCButton;
}

#pragma mark - UIButton Methods
- (void)moduleBButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleB_viewControllerWithTitle:@"Module B" extraB:@"Extra B"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)moduleCButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleC_viewControllerWithTitle:@"Module C" extraC:@"Extra C"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
