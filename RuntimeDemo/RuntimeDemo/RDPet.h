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

@property(nonatomic, copy) NSString *name;

- (void)introduce;

@end

NS_ASSUME_NONNULL_END
