//
//  http_model.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <string>

#include "Poco/Net/HTTPResponse.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Util/JSONConfiguration.h"
#include "Poco/JSON/Object.h"

using Poco::Net::HTTPResponse;
using Poco::Net::HTTPRequest;
using Poco::Util::JSONConfiguration;
using Poco::JSON::Object;

namespace ari {
    class HTTPModel {
    public:
        HTTPModel();
        
        virtual std::string httpMethod() = 0;
        
        virtual std::string path() = 0;
        
        virtual std::string toString();
        
        virtual void onRequestFinished(HTTPResponse::HTTPStatus status, const std::shared_ptr<JSONConfiguration> jsonConfig) = 0;
        
    protected:
        Object::Ptr _object;
    };
}
