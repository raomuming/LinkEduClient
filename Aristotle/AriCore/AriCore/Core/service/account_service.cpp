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
        auto self = shared_from_this();
        auto loginModel = std::make_shared<LoginUsingPhoneNumber>();
        loginModel->setPhoneNumber(number);
        loginModel->setPassword(password);
        
        
        loginModel->setCallback([self, callback](HTTPResponse::HTTPStatus status, AbstractConfiguration::Ptr json){
            if (status == HTTPResponse::HTTP_OK) {
                self->initAccount(json);
            }
            
            if (callback) {
                callback->onLogin(status == HTTPResponse::HTTP_OK);
            }
        });
        
        NetworkManager::instance()->addRequest(loginModel);
    }

    void AccountService::signupWithPhoneNumber(const std::string & number, const std::string & password)
    {
        auto signupModel = std::make_shared<Signup>();
        signupModel->setPhoneNumber(number);
        signupModel->setPassword(password);
        NetworkManager::instance()->addRequest(signupModel);
    }
    
    // private function
    void AccountService::initAccount(AbstractConfiguration::Ptr json) {
        auto name = json->getString("name");
    }
}
