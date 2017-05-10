//
//  MKModuleB.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleB.h"

#import "MKModuleBController.h"

@implementation MKModuleB

+ (UIViewController *)moduleBControllerWithParams:(NSDictionary *)Params {
    MKModuleBController *moduleBController = [[MKModuleBController alloc] initWithTitle:Params[@"title"] extraB:Params[@"extraB"]];
    return moduleBController;
}

@end
