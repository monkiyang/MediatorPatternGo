//
//  MKMediator+ModuleA.h
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//
//  Category避免MKMediator过于臃肿

#import "MKMediator.h"

@interface MKMediator (ModuleA)

+ (UIViewController *)moduleA_viewControllerWithTitle:(NSString *)title extraA:(NSString *)extraA;

@end
