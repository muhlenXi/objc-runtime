//
//  RDPerson.m
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/10.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import "RDPerson.h"

@implementation RDPerson

+ (void)load {
    
}

- (void)sayHello
{
    NSLog(@"RDPerson: Hello Everybody!");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%@  👹", NSStringFromSelector(sel));
    return NO;
}

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"forwardingTargetForSelector");
//    return  nil;
//}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"methodSignatureForSelector");
//    return  nil;
//}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}

@end 
