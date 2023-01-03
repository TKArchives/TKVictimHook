//
//  NSObject+Hook.m
//  TKVictimHook
//
//  Created by ZhengXianda on 11/23/22.
//

#import "NSObject+Hook.h"

#import <objc/runtime.h>

@implementation NSObject (Hook)

+ (void)load {
    Class cls = NSClassFromString(@"CodedLock");
    Method originalMethod = class_getClassMethod(cls, NSSelectorFromString(@"unlock:"));
    Method newMethod = class_getClassMethod(cls, NSSelectorFromString(@"unlock_hook:"));
    method_exchangeImplementations(originalMethod, newMethod);
}

+ (BOOL)unlock_hook:(NSInteger)code {
    return YES;
}

@end
