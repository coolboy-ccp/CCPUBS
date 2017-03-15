//
//  UIControl+ControlStatistics.m
//  CCPUBS
//
//  Created by 储诚鹏 on 17/2/13.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

#import "UIControl+ControlStatistics.h"
#import "CCPRuntime.h"

@implementation UIControl (ControlStatistics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originS = @selector(sendAction:to:forEvent:);
        SEL replaceS = @selector(ccp_sendAction:to:forEvent:);
        [CCPRuntime exchangeInClass:[self class] orginS:originS placeS:replaceS];
    });
}

- (void)ccp_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([[[event allTouches] anyObject] phase] == UITouchPhaseBegan) {
        NSString *actionString = NSStringFromSelector(action);
        NSString *targetName = NSStringFromClass([target class]);
        NSLog(@"controlTouch---%@---%@",actionString,targetName);
    }
    [self ccp_sendAction:action to:target forEvent:event];
}


@end
