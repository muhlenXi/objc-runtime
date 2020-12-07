//
//  RDFruit.h
//  HelloWorld
//
//  Created by muhlenXi on 2020/10/19.
//  Copyright © 2020 muhlenXi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDFruit : NSObject

@property (nonatomic,copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
