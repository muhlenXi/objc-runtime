//
//  main.m
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/10.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RDPerson *p = [[RDPerson alloc] init];
        NSString *className = [NSString stringWithUTF8String:object_getClassName(p)];
        NSLog(@"%@", className);
    }
    return 0;
}
