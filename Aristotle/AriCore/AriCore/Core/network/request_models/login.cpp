//
//  login.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "login.hpp"

namespace ari {
    std::string LoginUsingPhoneNumber::httpMethod()
    {
        return HTTPRequest::HTTP_POST;
    }
    
    std::string LoginUsingPhoneNumber::path()
    {
        return "https://link-edu.net/login";
    }
    
    void LoginUsingPhoneNumber::onRequestFinished(HTTPResponse::HTTPStatus status, const std::shared_ptr<JSONConfiguration> jsonConfig)
    {
        
    }
}
