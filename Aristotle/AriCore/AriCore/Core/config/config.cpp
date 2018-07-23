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
#include <iostream>
#include <iomanip>
#include <string>

#include "Poco/Util/Application.h"
#include "Poco/File.h"
#include "Poco/FileStream.h"
#include "Poco/StreamCopier.h"
#include "Poco/JSON/Parser.h"
#include "Poco/Dynamic/Var.h"

using Poco::File;
using Poco::FileException;
using Poco::FileStream;
using Poco::StreamCopier;
using Poco::JSON::Parser;
using Poco::DynamicAny;
using Poco::Dynamic::Var;

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
                    std::cout << "can not create file" << std::endl;
                    assert(0);
                    return;
                }
            } catch (FileException e) {
                std::cout << e.message();
                return;
            }
        }
        
        FileStream fs(path);
        std::string jsonStr;
        fs >> jsonStr;
        
        if (!jsonStr.empty()) {
            Parser iparser;
            std::istringstream istr(jsonStr);
            iparser.parse(istr);
            DynamicAny result = iparser.result();
            _object = result.extract<Object::Ptr>();
        }
        else {
            _object = new Object;
        }
    }
    
    void Config::setString(const std::string& key, const std::string& value)
    {
        _object->set(key, Var(value.c_str()));
        save();
    }
    
    std::string Config::getString(const std::string& key)
    {
        return _object->get(key).extract<std::string>();
    }
    
    void Config::setInt(const std::string& key, int64_t value)
    {
        _object->set(key, Var(value));
        save();
    }
    
    int64_t Config::getInt(const std::string& key)
    {
        int64_t value = 0;
        if (_object->has(key)) {
            value = _object->get(key).extract<Poco::Int64>();
        }
        return value;
    }
    
    void Config::setBool(const std::string& key, bool value)
    {
        _object->set(key, Var(value));
        save();
    }
    
    bool Config::getBool(const std::string& key)
    {
        return _object->get(key).extract<bool>();
    }
    
    void Config::save()
    {
        std::ostringstream out;
        _object->stringify(out);
        
        auto fileStorageProvider = Pal::getPalBundle()->getFileStorageProvider();
        auto path = fileStorageProvider->getDocumentPath("config.json");
        
        FileStream fs(path);
        fs << out.str();
    }
}
