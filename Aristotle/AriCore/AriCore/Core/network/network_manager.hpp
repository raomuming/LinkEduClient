//
//  network_manager.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <memory>

#include "http_params.hpp"

namespace ari {
    class NetworkManager
    {
    public:
        static std::shared_ptr<NetworkManager> instance();
        
        void addRequest(const std::shared_ptr<HTTPParams> params);
        
    private:
        static std::string url;
    };
}
