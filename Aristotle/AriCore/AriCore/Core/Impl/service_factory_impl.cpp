//
//  ari_service_factory_impl.cpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "service_factory_impl.hpp"

#include <string>

namespace ari {
    std::string ServiceFactory::hello()
    {
        return "Hello World!";
    }
}
