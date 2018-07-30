//
//  course_service.cpp
//  AriCore
//
//  Created by Eric Rao on 01/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "course_service.hpp"
#include "../network/request_models/course.hpp"
#include "../network/network_manager.hpp"
#include "../interface/model/create_course_info.hpp"
#include "../../Api/gen/service_factory.hpp"
#include "./account_service.hpp"

namespace ari {
    
    void CourseService::createCourse(const std::shared_ptr<ICreateCourseInfo> & info)
    {
        auto course = std::make_shared<CreateCourse>();
        course->setName(info->getName());
        course->setDescription(info->getDescription());
        course->setStartTime(info->getStartTime());
        course->setEndTime(info->getEndTime());
        
        auto accountService = std::dynamic_pointer_cast<AccountService>(ServiceFactory::accountService());
        auto account = accountService->account();
        course->setCreator(account->id());
        
        course->setCallback([](HTTPResponse::HTTPStatus status, AbstractConfiguration::Ptr json){
            
        });
        
        NetworkManager::instance()->addRequest(course);
    }
}
