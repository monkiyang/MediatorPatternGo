//
//  MKMediator+ModuleB.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKMediator+ModuleB.h"

@implementation MKMediator (ModuleB)

+ (UIViewController *)moduleB_viewControllerWithTitle:(NSString *)title extraB:(NSString *)extraB {
    
    return [[self class] viewControllerWithModuleClass:@"MKModuleB" selector:@"moduleBControllerWithParams:" params:@{@"title": title, @"extraB": extraB}];
}

@end
