//
//  main.m
//  HelloWorld
//
//  Created by muhlenXi on 2020/9/5.
//  Copyright © 2020 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPerson.h"
#import "RDPet.h"
#import "RDTeacher.h"
#import <objc/runtime.h>

#ifdef DEBUG
#define Log(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define Log(format, ...);
#endif

void person() {
    RDPerson *p1 = [RDPerson alloc];
    RDPerson *p2 = [p1 init];
    RDPerson *p3 = [p1 init];
    Log(@"%@ -- %p -- %p",p1, p1, &p1);
    Log(@"%@ -- %p -- %p",p2, p2, &p2);
    Log(@"%@ -- %p -- %p",p3, p3, &p3);
}

void teacher() {
    RDTeacher *t = [[RDTeacher alloc] init];
    t.name = @"Lucy";
    t.hobby = @"Men";
    t.address = @"Earth";
    
    Log(@"%@", t);
}

void resolveMethod() {
    RDPet *cat = [RDPet new];
    [cat performSelector:@selector(eat)];
    [cat performSelector:@selector(eat:) withObject:@"fish"];
}

// KVO
void kvo() {
    RDPerson *person = [[RDPerson alloc] init];
    RDPet *dog = [RDPet new];
    [person addObserver:dog forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [person setValue:@"muge" forKeyPath:@"name"];
}

// KVC
void kvc() {
    RDPerson *person = [[RDPerson alloc] init];
    RDPet *dog = [RDPet new];
    //person.pet = dog;
    
    [person setValue:@"xiaobai" forKeyPath:@"name"];
    [person setValue:@19 forKeyPath:@"age"];
    [person setValue:@"wangcai" forKeyPath:@"pet.name"];
}

void testClass() {
    RDTeacher *person = [[RDTeacher alloc] init];
    Class cls0 = [person class];
    Class cls1 = [RDTeacher class];
    NSLog(@"%p -- %p", cls0, cls1);  // objc_opt_class
    
    NSObject *object = [[NSObject alloc] init];
    Class cls2 = [object class];
    Class cls3 = [NSObject class];
    NSLog(@"%p -- %p", cls2, cls3);
}

void testGetMethod() {
    RDTeacher *t = [[RDTeacher alloc] init];
    Class cls = [t class];
    
    const char* className = class_getName(cls);
    Class metaCls = objc_getMetaClass(className);
    
    Method method0 = class_getInstanceMethod(cls, @selector(sayByebye));
    Method method1 = class_getInstanceMethod(metaCls, @selector(sayByebye));
    NSLog(@"getInstanceMethod --> %p %p \n", method0, method1);  // yes no
    
    Method method2 = class_getClassMethod(cls, @selector(sayStandUp));
    Method method3 = class_getClassMethod(metaCls, @selector(sayStandUp));
    NSLog(@"getClassMethod --> %p %p \n", method2, method3);     // yes yes
}

void testKindOf() {
    BOOL res0 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res1 = [(id)[RDTeacher class] isKindOfClass:[RDTeacher class]];
    // 1 0
    
    BOOL res2 = [(id)[NSObject alloc] isKindOfClass:[NSObject class]];
    BOOL res3 = [(id)[RDTeacher alloc] isKindOfClass:[RDTeacher class]];
    // 1 1
    
    NSLog(@"%d %d %d %d", res0, res1, res2, res3);
}

void testMemberOf() {
    BOOL res4 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res5 = [(id)[RDTeacher class] isMemberOfClass:[RDTeacher class]];
    // 0 0
       
    BOOL res6 = [(id)[NSObject alloc] isMemberOfClass:[NSObject class]];
    BOOL res7 = [(id)[RDTeacher alloc] isMemberOfClass:[RDTeacher class]];
    // 1 1
       
    NSLog(@"%d %d %d %d", res4, res5, res6, res7);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        testClass();
    }
    return 0;
}

