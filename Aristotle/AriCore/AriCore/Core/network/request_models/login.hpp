//
//  login.hpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../http_model.hpp"
#include "../../../Api/gen/i_login_callback.hpp"

#include <functional>

namespace ari {
    class LoginUsingPhoneNumber : public HTTPModel {
    public:
        LoginUsingPhoneNumber();
        
        std::string httpMethod() override;
        
        std::string path() override;
        
        void setPhoneNumber(const std::string& phoneNumber);
        
        void setPassword(const std::string& password);
        
    private:
        std::shared_ptr<ILoginCallback> _callback;
    };
}
