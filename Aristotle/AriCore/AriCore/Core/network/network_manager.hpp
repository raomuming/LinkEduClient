//
//  network_manager.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <memory>

#include "http_model.hpp"
#include "Poco/TaskManager.h"

using Poco::TaskManager;

namespace ari {
    class NetworkManager
    {
    public:
        static std::shared_ptr<NetworkManager> instance();
        
        NetworkManager();
        
        void addRequest(const std::shared_ptr<HTTPModel> model);
        
    private:
        std::shared_ptr<TaskManager> taskManager;
    };
}
