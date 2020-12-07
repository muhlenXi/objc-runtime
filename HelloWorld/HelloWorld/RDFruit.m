//
//  RDFruit.m
//  HelloWorld
//
//  Created by muhlenXi on 2020/10/19.
//  Copyright © 2020 muhlenXi. All rights reserved.
//

#import "RDFruit.h"

@implementation RDFruit

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"fruit 初始化了");
        self.name = @"unknow";
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        NSLog(@"fruit name 初始化了");
        self.name = name;
    }
    return self;
}

@end
