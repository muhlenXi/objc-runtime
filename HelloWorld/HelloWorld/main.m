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
#import "RDStudent.h"
#import "RDFruit.h"

#import <objc/runtime.h>
#import <objc/message.h>

#ifdef DEBUG
#define Log(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define Log(format, ...);
#endif

extern void instrumentObjcMessageSends(BOOL);

void person() {
    RDPerson *p1 = [[RDPerson alloc] init];
    p1.nickName = @"zhangsan";
    RDPerson *p2 = [p1 init];
    RDPerson *p3 = [p1 init];
    Log(@"%@ -- %p -- %p",p1, p1, &p1);
    Log(@"%@ -- %p -- %p",p2, p2, &p2);
    Log(@"%@ -- %p -- %p",p3, p3, &p3);
}

void personIsa() {
    RDPerson *p1 = [[RDPerson alloc] init];
    p1.nickName = @"zhangsan";
    RDPerson *p2 = p1;
    RDPerson *p3 = p1;
    RDPerson *p4 = p1;
    RDPerson *p5 = p1;
    
    // 创建一个 RDPet 对象，然后让 5 个 RDPet 类型指针指向这个对象，此时该对象的引用计数是 5，然后分析一下 isa 中的数据是否也是这样的。
    Log(@"%@ -- %p",p1, p1);
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

void testPet() {
    RDPet *pet = [[RDPet alloc] init];
    [pet playToy1];
    [pet playToy2];
    [pet playToy3];
    [pet playToy4];
    [pet playToy5];
    [pet playToy6];
}

void testMessageSend() {
    RDPerson *person = [[RDPerson alloc] init];
    RDStudent *student = [[RDStudent alloc] init];
    
    [person sayHello];
    [student sayHello];
    [student goToSchool];
    
    
    objc_msgSend(person, sel_registerName("sayHello"));
    struct objc_super father;
    father.receiver = student;
    father.super_class = [RDPerson class];

    objc_msgSendSuper(&father, sel_registerName("sayHello"));
    objc_msgSend(student, sel_registerName("goToSchool"));
}

void printf_bin(int num)
{
    int i, j, k;
    unsigned char *p = (unsigned char*)&num + 3;

    for (i = 0; i < 8; i++) //处理4个字节(32位）
    {
        j = *(p - i); //取每个字节的首地址
        for (int k = 7; k >= 0; k--) //处理每个字节的8个位
        {
            if (j & (1 << k))
                printf("1");
            else
                printf("0");
        }
        printf(" ");
    }
    printf("\r\n");
}

void testMessageForward() {
//    RDPerson *p1 = [[RDPerson alloc] init];
//    RDPet *pet = [[RDPet alloc] init];
//    RDTeacher *teacher = [[RDTeacher alloc] init];
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RDPet *pet = [[RDPet alloc] init];
        
        NSLog(@"%@", pet);
    }
    return 0;
}

