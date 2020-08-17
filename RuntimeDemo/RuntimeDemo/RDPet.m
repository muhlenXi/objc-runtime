//
//  RDPet.m
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/15.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import "RDPet.h"
#import <objc/message.h>

@implementation RDPet

- (void)introduce {
    NSLog(@"%@ 哈哈哈哈", self.name);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"object: %@", object);
    NSLog(@"keyPath: %@", keyPath);
    NSLog(@"change: %@", change);
}

void eat(id self, SEL _cmd) {
    NSLog(@"%@ 调用 %@ 方法", self, NSStringFromSelector(_cmd));
    NSLog(@"pet eat VVV");
}

void eatFood(id self, SEL _cmd, id object) {
    NSLog(@"pet eat %@", object);
}

// 方法转发
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(eat)) {
        class_addMethod([RDPet class], sel, (IMP) eat, "v");
    } else if (sel == @selector(eat:)) {
        class_addMethod([RDPet class], sel, (IMP) eatFood, "v@:@");
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}

@end
