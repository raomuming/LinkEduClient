//
//  create_course_info.cpp
//  AriCore
//
//  Created by Eric Rao on 2018/7/24.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "create_course_info.hpp"

#include "Poco/Dynamic/Var.h"

using Poco::Dynamic::Var;

namespace ari {
    CreateCourseInfo::CreateCourseInfo() : _object(new Object)
    {
    }
    
    void CreateCourseInfo::setName(const std::string & name)
    {
        _object->set("name", Var(name.c_str()));
    }
    
    std::string CreateCourseInfo::getName()
    {
        if (_object->has("name")) {
            return _object->get("name").extract<std::string>();
        }
        return "";
    }
    
    void CreateCourseInfo::setDescription(const std::string & description)
    {
        _object->set("description", Var(description.c_str()));
    }
    
    std::string CreateCourseInfo::getDescription()
    {
        if (_object->has("description")) {
            return _object->get("description").extract<std::string>();
        }
        return "";
    }
    
    void CreateCourseInfo::setStartTime(int64_t time)
    {
        _object->set("start_time", Var(time));
    }
    
    int64_t CreateCourseInfo::getStartTime()
    {
        if (_object->has("start_time")) {
            return _object->get("start_time").extract<int64_t>();
        }
        return 0;
    }
    
    void CreateCourseInfo::setEndTime(int64_t time)
    {
        _object->set("end_time", Var(time));
    }
    
    int64_t CreateCourseInfo::getEndTime()
    {
        if (_object->has("end_time")) {
            return _object->get("end_time").extract<int64_t>();
        }
        return 0;
    }
}
