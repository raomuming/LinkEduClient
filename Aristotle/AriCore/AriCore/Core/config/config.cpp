//
//  config.cpp
//  AriCore
//
//  Created by Eric Rao on 16/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "config.hpp"
#include "../../Api/gen/pal.hpp"
#include "../../Api/gen/i_file_storage_provider.hpp"
#include "../../Api/gen/i_pal_bundle.hpp"

#include <mutex>

#include "Poco/Util/Application.h"
#include "Poco/File.h"

using Poco::File;
using Poco::FileException;

const std::string filePath = "./config.json";

namespace ari {
    std::shared_ptr<Config> Config::instance()
    {
        static std::shared_ptr<Config> instance = nullptr;
        static std::once_flag flag;
        std::call_once(flag, [&]{
            instance.reset(new Config);
        });
        
        return instance;
    }
    
    Config::Config()
    {
        auto fileStorageProvider = Pal::getPalBundle()->getFileStorageProvider();
        auto path = fileStorageProvider->getDocumentPath("config.json");
        auto file = new File(path);
        if (!file->exists()) {
            try {
                bool success = file->createFile();
                if (!success) {
                    
                }
            } catch (FileException e) {
                std::cout << e.message();
            }
        }
    }
    
    void Config::setString(const std::string& key, const std::string& value)
    {
        
    }
    
    std::string Config::getString(const std::string& key)
    {
        return "";
    }
    
    void Config::setInt(const std::string& key, int value)
    {
        
    }
    
    int Config::getInt(const std::string& key)
    {
        return 0;
    }
    
    void Config::setBool(const std::string& key, bool value)
    {
        
    }
    
    bool Config::getBool(const std::string& key)
    {
        return true;
    }
}
