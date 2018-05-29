//
//  task.cpp
//  AriCore
//
//  Created by Eric Rao on 29/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "async_task.hpp"

namespace ari {
    void AsyncTask::run()
    {
        if (_func) {
            _func();
        }
    }
}
