//
//  AriCore.m
//  AriCore
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#import "AriCore.h"
#import "Core/hello.hpp"

@implementation AriCore

- (void)sayHello {
    //NSLog(@"Hello World!");
    Hello::sayHello();
}

@end
