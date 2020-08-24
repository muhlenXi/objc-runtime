//
//  RDPerson.h
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/10.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RDPet.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDPerson : NSObject

@property(nonatomic, assign) NSInteger age;
@property(nonatomic, copy) NSString *name;
//@property(nonatomic, strong) RDPet *pet;

- (void)sayHello;
+ (void)helloWorld;

@end

NS_ASSUME_NONNULL_END
