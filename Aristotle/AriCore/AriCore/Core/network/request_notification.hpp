//
//  request_notification.hpp
//  AriCore
//
//  Created by Eric Rao on 28/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "Poco/Notification.h"
#include "Poco/AutoPtr.h"

using Poco::AutoPtr;
using Poco::Notification;

namespace ari {
    class RequestNotification : public Notification {
    public:
        typedef AutoPtr<RequestNotification> Ptr;
    private:
        
    };
}
