//
//  signup.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "signup.hpp"
#include "Poco/Dynamic/Var.h"

using Poco::Dynamic::Var;

namespace ari {
    std::string Signup::httpMethod()
    {
        return HTTPRequest::HTTP_POST;
    }
    
    std::string Signup::path()
    {
        return "https://link-edu.net/t/register";
    }
    
    void Signup::setPhoneNumber(const std::string& phoneNumber)
    {
        _object->set("phone_number", Var(phoneNumber.c_str()));
    }
    
    void Signup::setPassword(const std::string& password)
    {
        _object->set("password", Var(password.c_str()));
    }
}
