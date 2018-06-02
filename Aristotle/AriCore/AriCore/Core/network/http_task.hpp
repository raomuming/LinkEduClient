//
//  http_task.hpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "Poco/Task.h"
#include "./http_model.hpp"
using Poco::Task;

namespace ari{
    class HTTPTask : public Task {
    public:
        explicit HTTPTask(const std::shared_ptr<HTTPModel>& model);
        
        virtual ~HTTPTask();
        
        void runTask() override;
    private:
        std::shared_ptr<HTTPModel> _model;
    };
}
