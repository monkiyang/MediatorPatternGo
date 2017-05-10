//
//  MKMediator+ModuleA.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKMediator+ModuleA.h"

@implementation MKMediator (ModuleA)

+ (UIViewController *)moduleA_viewControllerWithTitle:(NSString *)title extraA:(NSString *)extraA {
    
    return [[self class] viewControllerWithModuleClass:@"MKModuleA" selector:@"moduleAControllerWithParams:" params:@{@"title": title, @"extraA": extraA}];
}

@end
