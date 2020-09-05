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

#ifdef DEBUG
#define Log(format, ...) printf("%s\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define Log(format, ...);
#endif

void kvo(void);
void kvc(void);
void resolveMethod(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RDPerson *p1 = [RDPerson alloc];
        RDPerson *p2 = [p1 init];
        RDPerson *p3 = [p1 init];
        Log(@"%@ -- %p -- %p",p1, p1, &p1);
        Log(@"%@ -- %p -- %p",p2, p2, &p2);
        Log(@"%@ -- %p -- %p",p3, p3, &p3);
    }
    return 0;
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
    [person sayHello];
}
