//
//  create_course_info.hpp
//  AriCore
//
//  Created by Eric Rao on 2018/7/24.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include "../../../Api/gen/i_create_course_info.hpp"

#include "Poco/JSON/Object.h"
#include "Poco/AutoPtr.h"

using Poco::JSON::Object;
using Poco::AutoPtr;

namespace ari {
    class CreateCourseInfo : public ICreateCourseInfo
    {
    public:
        CreateCourseInfo();
        
        void setName(const std::string & name) override;
        
        std::string getName() override;
        
        void setDescription(const std::string & description) override;
        
        std::string getDescription() override;
        
        void setStartTime(int64_t time) override;
        
        int64_t getStartTime() override;
        
        void setEndTime(int64_t time) override;
        
        int64_t getEndTime() override;
        
    private:
        Object::Ptr _object;
    };
}
