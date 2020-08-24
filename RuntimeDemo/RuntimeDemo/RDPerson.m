//
//  RDPerson.m
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/10.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import "RDPerson.h"

@implementation RDPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"unknow";
        self.age = 0;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"Hello, I am %@, I am %ld years old. \n", self.name, self.age);
    //[self.pet introduce];
}

+ (void)helloWorld {
    NSLog(@"Hello World!");
}

@end
