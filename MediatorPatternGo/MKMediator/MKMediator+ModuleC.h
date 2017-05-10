//
//  MKMediator+ModuleC.h
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//
//  Category避免MKMediator过于臃肿

#import "MKMediator.h"

@interface MKMediator (ModuleC)

+ (UIViewController *)moduleC_viewControllerWithTitle:(NSString *)title extraC:(NSString *)extraC;

@end
