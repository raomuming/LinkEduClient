//
//  lockable.hpp
//  AriCore
//
//  Created by Eric Rao on 16/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <mutex>

namespace ari {
    class Lockable {
    public:
        void lock();
        bool tryLock();
        void unlock();
        
    private:
        std::mutex _mutex;
    };
}
