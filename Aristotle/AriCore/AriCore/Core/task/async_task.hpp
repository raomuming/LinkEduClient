//
//  task.hpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "Poco/Runnable.h"
#include <functional>

using Poco::Runnable;

namespace ari {
    class AsyncTask : public Runnable {
    public:
        
        void run() override;
        
        void setFunc(std::function<void()> func) {
            _func = func;
        }
        
    private:
        std::function<void()> _func;
    };
}
