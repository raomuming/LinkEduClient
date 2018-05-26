//
//  hello.cpp
//  AriCore
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "hello.hpp"
#include <iostream>

#include "Poco/Timezone.h"

void Hello::sayHello()
{
    int offset = Poco::Timezone::utcOffset();
    std::cout << "Hello World!" << std::endl;
}
