//
//  MKModuleA.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/10.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKModuleA.h"

#import "MKModuleAController.h"

@implementation MKModuleA

+ (UIViewController *)moduleAControllerWithParams:(NSDictionary *)Params {
    MKModuleAController *moduleAController = [[MKModuleAController alloc] initWithTitle:Params[@"title"] extraA:Params[@"extraA"]];
    return moduleAController;
}

@end
