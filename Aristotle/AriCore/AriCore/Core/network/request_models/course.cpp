//
//  course.cpp
//  AriCore
//
//  Created by Eric Rao on 01/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "course.hpp"
#include "Poco/Dynamic/Var.h"

using Poco::Dynamic::Var;

namespace ari {
    std::string CreateCourse::httpMethod()
    {
        return HTTPRequest::HTTP_PUT;
    }
    
    std::string CreateCourse::path()
    {
        return "https://link-edu.net/t/course";
    }
    
    void CreateCourse::setName(const std::string& name)
    {
        _object->set("name", Var(name.c_str()));
    }
    
    void CreateCourse::setDescription(const std::string& description)
    {
        _object->set("description", Var(description.c_str()));
    }
    
    void CreateCourse::setStartTime(int64_t startTime)
    {
        _object->set("start_at", Var(startTime));
    }
    
    void CreateCourse::setEndTime(int64_t endTime)
    {
        _object->set("end_at", Var(endTime));
    }
}
