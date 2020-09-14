//
//  RDTeacher.h
//  HelloWorld
//
//  Created by muhlenXi on 2020/9/14.
//  Copyright © 2020 muhlenXi. All rights reserved.
//

#import "RDPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDTeacher : RDPerson

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * hobby;
@property (nonatomic,copy) NSString * address;

+ (void)sayStandUp;
- (void)sayByebye;


@end

NS_ASSUME_NONNULL_END
