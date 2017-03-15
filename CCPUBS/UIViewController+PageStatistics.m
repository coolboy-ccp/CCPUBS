//
//  UIViewController+PageStatistics.m
//  CCPUBS
//
//  Created by 储诚鹏 on 17/2/13.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

#import "UIViewController+PageStatistics.h"

@implementation UIViewController (PageStatistics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL orginS = @selector(viewWillAppear:);
        SEL replaceS = @selector(ccp_viewWillAppear:);
        [CCPRuntime exchangeInClass:[self class] orginS:orginS placeS:replaceS];
        SEL orginS1 = @selector(viewWillDisappear:);
        SEL replaceS1 = @selector(ccp_viewWillDisappear:);
        [CCPRuntime exchangeInClass:[self class] orginS:orginS1 placeS:replaceS1];
    });
}

- (void)ccp_viewWillAppear:(BOOL)animated {
    self.title = NSStringFromClass([self class]);
    [self enterViewWithPageID:@"123"];
    [self ccp_viewWillAppear:animated];
}

- (void)ccp_viewWillDisappear:(BOOL)animated {
    [self leaveViewWithPageID:@"123"];
    [self ccp_viewWillDisappear:animated];
}

- (void)enterViewWithPageID:(NSString *)pID {
    NSLog(@"enter:%@%@",NSStringFromClass([self class]),pID);
}

- (void)leaveViewWithPageID:(NSString *)pID {
    NSLog(@"leave:%@%@",NSStringFromClass([self class]),pID);
}

@end
