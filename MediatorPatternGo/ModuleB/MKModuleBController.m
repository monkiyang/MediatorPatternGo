//
//  MKModuleBController.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/9.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleBController.h"

#import "MKMediator+ModuleA.h"
#import "MKMediator+ModuleC.h"

@interface MKModuleBController ()
@property (nonatomic, strong) UIButton *moduleAButton;
@property (nonatomic, strong) UIButton *moduleCButton;

@property (nonatomic, copy) NSString *theTitle;
@end

@implementation MKModuleBController

- (instancetype)initWithTitle:(NSString *)title extraB:(NSString *)extraB {
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
    [self.view addSubview:self.moduleAButton];
    [self.view addSubview:self.moduleCButton];
    
    _moduleAButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"topGuide": self.topLayoutGuide ,@"moduleAButton": _moduleAButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleAButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][moduleAButton(44.)]" options:0 metrics:nil views:views]];
    
    _moduleCButton.translatesAutoresizingMaskIntoConstraints = NO;
    views = @{@"moduleAButton": _moduleAButton, @"moduleCButton": _moduleCButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleCButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[moduleAButton][moduleCButton(44.)]" options:0 metrics:nil views:views]];
}

#pragma mark - Setter && Getter Methods
- (UIButton *)moduleAButton {
    if (!_moduleAButton) {
        _moduleAButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moduleAButton.exclusiveTouch = YES;
        
        [_moduleAButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moduleAButton setTitle:@"Module A" forState:UIControlStateNormal];
        [_moduleAButton addTarget:self action:@selector(moduleAButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moduleAButton;
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
- (void)moduleAButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleA_viewControllerWithTitle:@"Module A" extraA:@"Extra A"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)moduleCButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleC_viewControllerWithTitle:@"Module C" extraC:@"Extra C"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
