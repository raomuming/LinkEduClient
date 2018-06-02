//
//  account_service.hpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../../Api/gen/i_account_service.hpp"

namespace ari {
    class AccountService : public IAccountService {
    public:
        bool isLoggedIn() override;
        
        void login() override;

    private:
    };
}
