//
//  http_model.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <string>
#include <functional>
#include <memory>

#include "Poco/Net/HTTPResponse.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Util/JSONConfiguration.h"
#include "Poco/Util/AbstractConfiguration.h"
#include "Poco/JSON/Object.h"
#include "Poco/AutoPtr.h"

using Poco::Net::HTTPResponse;
using Poco::Net::HTTPRequest;
using Poco::Util::JSONConfiguration;
using Poco::Util::AbstractConfiguration;
using Poco::JSON::Object;
using Poco::AutoPtr;

typedef std::function<void(HTTPResponse::HTTPStatus, AbstractConfiguration::Ptr)> ModelCallback;

namespace ari {
    class HTTPModel {
    public:
        HTTPModel();
        
        virtual std::string httpMethod() = 0;
        
        virtual std::string path() = 0;
        
        virtual std::string toString();
        
        virtual void onRequestFinished(HTTPResponse::HTTPStatus status, AbstractConfiguration::Ptr jsonConfig);
        
        virtual void setCallback(ModelCallback callback);
        
    protected:
        Object::Ptr _object;
        ModelCallback _callback;
    };
}
