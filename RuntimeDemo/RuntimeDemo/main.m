//
//  main.m
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/10.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPerson.h"
#import "RDPet.h"


void kvo(void);
void kvc(void);
void resolveMethod(void);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RDPet *pet = [RDPet new];
        NSLog(@"%p", [pet class]);
        NSLog(@"%p", [RDPet class]);
        
        
        
        BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
        BOOL res2 = [[NSObject class] isMemberOfClass:[NSObject class]];
        BOOL res3 = [[RDPerson class] isKindOfClass:[RDPerson class]];
        BOOL res4 = [[RDPerson class] isMemberOfClass:[RDPerson class]];
        NSLog(@"%d %d %d %d", res1, res2, res3, res4);

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


