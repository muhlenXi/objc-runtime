//
//  RDPet.h
//  RuntimeDemo
//
//  Created by muhlenXi on 2020/8/15.
//  Copyright © 2020 muhlenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDPet : NSObject

@property (nonatomic,copy) NSString *name;

- (void)playToy1;
- (void)playToy2;
- (void)playToy3;
- (void)playToy4;
- (void)playToy5;
- (void)playToy6;

@end

NS_ASSUME_NONNULL_END
