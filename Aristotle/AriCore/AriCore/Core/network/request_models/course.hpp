//
//  course.hpp
//  AriCore
//
//  Created by Eric Rao on 01/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../http_model.hpp"

namespace ari {
    class CreateCourse : public HTTPModel {
    public:
        std::string httpMethod() override;
        
        std::string path() override;
        
        // set params
        void setName(const std::string& name);
        
        void setDescription(const std::string& description);
        
        void setStartTime(int64_t startTime);
        
        void setEndTime(int64_t endTime);
    };
}
