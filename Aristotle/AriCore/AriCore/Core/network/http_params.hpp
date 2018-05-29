//
//  http_params.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <string>

#include "Poco/Net/HTTPResponse.h"
#include "Poco/Util/JSONConfiguration.h"

using Poco::Net::HTTPResponse;
using Poco::Util::JSONConfiguration;

namespace ari {
    class HTTPParams {
    public:
        virtual std::string httpMethod() = 0;
        
        virtual std::string path() = 0;
        
        virtual std::string toString() = 0;
        
        virtual void onRequestFinished(HTTPResponse::HTTPStatus status, const std::shared_ptr<JSONConfiguration> jsonConfig) = 0;
    };
}
