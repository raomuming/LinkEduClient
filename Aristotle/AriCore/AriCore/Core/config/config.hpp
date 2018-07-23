//
//  config.hpp
//  AriCore
//
//  Created by Eric Rao on 16/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <memory>

namespace ari {
    class Config {
    public:
        static std::shared_ptr<Config> instance();
        
        void setString(const std::string& key, const std::string& value);
        std::string getString(const std::string& key);
        
        void setInt(const std::string& key, int value);
        int getInt(const std::string& key);
        
        void setBool(const std::string& key, bool value);
        bool getBool(const std::string& key);
        
    private:
        Config();
        Config(const Config&) = delete;
        Config& operator=(const Config&) = delete;
    };
}
