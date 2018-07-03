//
//  login.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "login.hpp"
#include "Poco/Dynamic/Var.h"

using Poco::Dynamic::Var;

namespace ari {
    
    LoginUsingPhoneNumber::LoginUsingPhoneNumber()
    {}
    
    std::string LoginUsingPhoneNumber::httpMethod()
    {
        return HTTPRequest::HTTP_POST;
    }
    
    std::string LoginUsingPhoneNumber::path()
    {
        return "https://link-edu.net/t/login";
    }
    
    void LoginUsingPhoneNumber::setPhoneNumber(const std::string& phoneNumber)
    {
        _object->set("phone_number", Var(phoneNumber.c_str()));
    }
    
    void LoginUsingPhoneNumber::setPassword(const std::string& password)
    {
        _object->set("password", Var(password.c_str()));
    }
}
