//
//  service_factory_impl.cpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "../gen/service_factory.hpp"
#include "../../Core/service/account_service.hpp"

#include <mutex>
#include <memory>

namespace ari {
    std::shared_ptr<IAccountService> ServiceFactory::accountService()
    {
        static std::once_flag flag;
        static std::shared_ptr<IAccountService> accountService;
        std::call_once(flag, [&]{
            accountService = std::make_shared<AccountService>();
        });
        
        return accountService;
    }
}
