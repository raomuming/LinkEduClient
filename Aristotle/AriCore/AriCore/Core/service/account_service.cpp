//
//  account_service.cpp
//  AriCore
//
//  Created by Eric Rao on 27/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "account_service.hpp"
#include "../network/request_models/login.hpp"
#include "../network/request_models/signup.hpp"
#include "../network/network_manager.hpp"

#include "../../Api/gen/i_login_callback.hpp"

namespace ari {
    bool AccountService::isLoggedIn()
    {
        return false;
    }

    void AccountService::loginWithPhoneNumber(const std::string & number, const std::string & password, const std::shared_ptr<ILoginCallback> & callback)
    {
        auto loginModel = std::make_shared<LoginUsingPhoneNumber>(callback);
        loginModel->setPhoneNumber(number);
        loginModel->setPassword(password);
        NetworkManager::instance()->addRequest(loginModel);
    }

    void AccountService::signupWithPhoneNumber(const std::string & number, const std::string & password)
    {
        auto signupModel = std::make_shared<Signup>();
        signupModel->setPhoneNumber(number);
        signupModel->setPassword(password);
        NetworkManager::instance()->addRequest(signupModel);
    }
}
