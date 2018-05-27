//
//  service_factory_impl.cpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "../gen/service_factory.hpp"

namespace ari {
    std::shared_ptr<IAccountService> ServiceFactory::accountService()
    {
        return nullptr;
    }
}
