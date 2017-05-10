//
//  MKMediator.m
//  MediatorPatternGo
//
//  Created by YangMengqi on 2017/5/9.
//  Copyright © 2017年 MengQi Yang. All rights reserved.
//

#import "MKMediator.h"

@implementation MKMediator

#pragma mark - Public Methods
+ (UIViewController *)viewControllerWithModuleClass:(NSString *)moduleClass selector:(NSString *)selector params:(NSDictionary *)params {
    if (moduleClass.length == 0 || selector.length == 0 || !params) {
        return nil;
    }
    //target-action解除MKMediator对MKModuleX的感官依赖，运行时仍存在依赖
    Class cls = NSClassFromString(moduleClass);
    SEL sel = NSSelectorFromString(selector);
    if (!cls || !sel) {
        return nil;
    }
    
    if ([cls respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [cls performSelector:sel withObject:params];
#pragma clang diagnostic pop
    }
    
    return nil;
}

@end
