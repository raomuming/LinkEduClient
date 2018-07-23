//
//  config.hpp
//  AriCore
//
//  Created by Eric Rao on 16/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <memory>

#include "Poco/JSON/Object.h"
#include "Poco/AutoPtr.h"

using Poco::JSON::Object;
using Poco::AutoPtr;

namespace ari {
    class Config {
    public:
        static std::shared_ptr<Config> instance();
        
        void setString(const std::string& key, const std::string& value);
        std::string getString(const std::string& key);
        
        void setInt(const std::string& key, int64_t value);
        int64_t getInt(const std::string& key);
        
        void setBool(const std::string& key, bool value);
        bool getBool(const std::string& key);
        
        void save();
        
    private:
        Config();
        Config(const Config&) = delete;
        Config& operator=(const Config&) = delete;
        
    private:
        Object::Ptr _object;
    };
}
