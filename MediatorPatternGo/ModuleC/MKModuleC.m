//
//  MKModuleC.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleC.h"

#import "MKModuleCController.h"

@implementation MKModuleC

+ (UIViewController *)moduleCControllerWithParams:(NSDictionary *)Params {
    MKModuleCController *moduleCController = [[MKModuleCController alloc] initWithTitle:Params[@"title"] extraC:Params[@"extraC"]];
    return moduleCController;
}

@end
