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

namespace ari {
    bool AccountService::isLoggedIn()
    {
        return false;
    }
    
    void AccountService::login()
    {
        auto requestModel = std::make_shared<LoginUsingPhoneNumber>();
        NetworkManager::instance()->addRequest(requestModel);
    }
    
    void AccountService::signupWithPhoneNumber(const std::string & number)
    {
        auto requestModel = std::make_shared<Signup>();
        requestModel->setPhoneNumber(number);
        NetworkManager::instance()->addRequest(requestModel);
    }
}
