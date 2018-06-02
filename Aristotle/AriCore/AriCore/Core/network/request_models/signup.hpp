//
//  signup.hpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../http_model.hpp"

namespace ari {
    class Signup : public HTTPModel {
    public:
        std::string httpMethod() override;
        
        std::string path() override;
                
        void onRequestFinished(HTTPResponse::HTTPStatus status, const std::shared_ptr<JSONConfiguration> jsonConfig) override;
        
        // config params
        void setPhoneNumber(const std::string& phoneNumber);
    };
}
