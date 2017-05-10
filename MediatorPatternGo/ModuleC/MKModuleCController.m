//
//  MKModuleCController.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/9.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleCController.h"

#import "MKMediator+ModuleA.h"
#import "MKMediator+ModuleB.h"

@interface MKModuleCController ()
@property (nonatomic, strong) UIButton *moduleAButton;
@property (nonatomic, strong) UIButton *moduleBButton;

@property (nonatomic, copy) NSString *theTitle;
@end

@implementation MKModuleCController

- (instancetype)initWithTitle:(NSString *)title extraC:(NSString *)extraC {
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
    [self.view addSubview:self.moduleBButton];
    
    _moduleAButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"topGuide": self.topLayoutGuide ,@"moduleAButton": _moduleAButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleAButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][moduleAButton(44.)]" options:0 metrics:nil views:views]];
    
    _moduleBButton.translatesAutoresizingMaskIntoConstraints = NO;
    views = @{@"moduleAButton": _moduleAButton, @"moduleBButton": _moduleBButton};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[moduleBButton(100.)]" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[moduleAButton][moduleBButton(44.)]" options:0 metrics:nil views:views]];
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

#pragma mark - UIButton Methods
- (void)moduleAButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleA_viewControllerWithTitle:@"Module A" extraA:@"Extra A"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)moduleBButtonClicked:(UIButton *)sender {
    UIViewController *viewController = [MKMediator moduleB_viewControllerWithTitle:@"Module B" extraB:@"Extra B"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
