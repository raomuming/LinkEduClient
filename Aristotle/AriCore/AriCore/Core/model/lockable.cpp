//
//  lockable.cpp
//  AriCore
//
//  Created by Eric Rao on 16/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "lockable.hpp"

namespace ari {
    void Lockable::lock()
    {
        _mutex.lock();
    }
    
    bool Lockable::tryLock()
    {
        return _mutex.try_lock();
    }
    
    void Lockable::unlock()
    {
        _mutex.unlock();
    }
}
