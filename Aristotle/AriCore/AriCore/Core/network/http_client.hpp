//
//  http_client.hpp
//  AriCore
//
//  Created by Eric Rao on 28/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "Poco/Notification.h"
#include "Poco/NotificationQueue.h"
#include "Poco/Runnable.h"
#include "Poco/Util/AbstractConfiguration.h"
#include "Poco/AutoPtr.h"

using Poco::Notification;
using Poco::NotificationQueue;
using Poco::Runnable;

namespace ari {
    class HTTPClient : public Runnable {
    public:
        HTTPClient(const std::string& name, NotificationQueue& queue);
        void run() override;
      
    private:
        Poco::AutoPtr<Poco::Util::AbstractConfiguration> doRequest();
        
    private:
        std::string _name;
        NotificationQueue& _queue;
    };
}
