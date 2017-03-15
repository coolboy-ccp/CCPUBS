//
//  CCPRuntime.m
//  CCPUBS
//
//  Created by 储诚鹏 on 17/2/13.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

#import "CCPRuntime.h"
#import <objc/runtime.h>

@implementation CCPRuntime

+ (void)exchangeInClass:(Class)cls orginS:(SEL)os placeS:(SEL)ps {
    Method oM = class_getInstanceMethod(cls, os);
    Method pM = class_getInstanceMethod(cls, ps);
    BOOL addMethod = class_addMethod(cls, os, method_getImplementation(pM), method_getTypeEncoding(pM));
    if (addMethod) {
        class_replaceMethod(cls, ps, method_getImplementation(oM), method_getTypeEncoding(oM));
    }
    else {
        method_exchangeImplementations(oM, pM);
    }
}

@end
