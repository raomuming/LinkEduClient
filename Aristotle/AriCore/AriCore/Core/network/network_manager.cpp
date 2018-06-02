//
//  network_manager.cpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "network_manager.hpp"
#include "Poco/ThreadPool.h"
#include "Poco/URI.h"
#include "Poco/Util/JSONConfiguration.h"
#include "Poco/Net/HTTPSClientSession.h"
#include "Poco/Net/HTTPRequest.h"
#include "Poco/Net/HTTPResponse.h"
#include "http_task.hpp"
#include <mutex>

using Poco::ThreadPool;
using Poco::Net::HTTPSClientSession;
using Poco::URI;
using Poco::Util::JSONConfiguration;
using Poco::Net::HTTPRequest;
using Poco::Net::HTTPResponse;

namespace ari {
    
    std::shared_ptr<NetworkManager> NetworkManager::instance()
    {
        static std::shared_ptr<NetworkManager> instance;
        static std::once_flag flag;
        std::call_once(flag, [&]{
            instance = std::make_shared<NetworkManager>();
        });
        return instance;
    }
    
    NetworkManager::NetworkManager()
    {
        taskManager = std::make_shared<TaskManager>();
    }

    void NetworkManager::addRequest(const std::shared_ptr<HTTPModel> model)
    {
        auto task = new HTTPTask(model);
        taskManager->start(task);
    }
}
