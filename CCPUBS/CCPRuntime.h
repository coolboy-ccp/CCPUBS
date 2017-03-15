//
//  CCPRuntime.h
//  CCPUBS
//
//  Created by 储诚鹏 on 17/2/13.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCPRuntime : NSObject

+ (void)exchangeInClass:(Class)cls orginS:(SEL)os placeS:(SEL)ps;

@end
