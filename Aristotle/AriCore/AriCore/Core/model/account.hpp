//
//  account.hpp
//  AriCore
//
//  Created by Eric Rao on 03/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#pragma once

#include <string>

#include "lockable.hpp"

namespace ari {
    class Account : public Lockable {
    public:
        int64_t id();
        void setId(int64_t id);
        
        std::string name();
        void setName(std::string name);
        
        std::string phoneNumber();
        void setPhoneNumber(std::string number);
        
    private:
        int64_t _id;
        std::string _name;
        std::string _phoneNumber;
    };
}
