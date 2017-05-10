//
//  MKMediator+ModuleC.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKMediator+ModuleC.h"

@implementation MKMediator (ModuleC)

+ (UIViewController *)moduleC_viewControllerWithTitle:(NSString *)title extraC:(NSString *)extraC {
    
    return [[self class] viewControllerWithModuleClass:@"MKModuleC" selector:@"moduleCControllerWithParams:" params:@{@"title": title, @"extraC": extraC}];
}

@end
