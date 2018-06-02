//
//  signup.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "signup.hpp"

namespace ari {
    std::string Signup::httpMethod()
    {
        return HTTPRequest::HTTP_POST;
    }
    
    std::string Signup::path()
    {
        return "https://link-edu.net/signup";
    }
    
    void Signup::onRequestFinished(HTTPResponse::HTTPStatus status, const std::shared_ptr<JSONConfiguration> jsonConfig)
    {
        
    }
}
