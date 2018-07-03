//
//  account_service.hpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../../Api/gen/i_account_service.hpp"
#include "../model/account.hpp"
#include "Poco/Util/AbstractConfiguration.h"

#include <memory>

using Poco::Util::AbstractConfiguration;

namespace ari {
    class JSONConfiguration;

    class AccountService : public IAccountService, public std::enable_shared_from_this<AccountService> {
    public:
        bool isLoggedIn() override;
        
        void loginWithPhoneNumber(const std::string & number, const std::string & password, const std::shared_ptr<ILoginCallback> & callback) override;

        void signupWithPhoneNumber(const std::string & number, const std::string & password) override;
        
    private:
        void initAccount(AbstractConfiguration::Ptr json);
        
    private:
        std::shared_ptr<Account> _account;
    };
}
