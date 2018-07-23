//
//  account.cpp
//  AriCore
//
//  Created by Eric Rao on 03/07/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "account.hpp"

namespace ari {
    int64_t Account::id()
    {
        return _id;
    }
    
    void Account::setId(int64_t id)
    {
        _id = id;
    }
    
    std::string Account::name()
    {
        return _name;
    }
    
    void Account::setName(std::string name)
    {
        _name = name;
    }
    
    std::string Account::phoneNumber()
    {
        return _phoneNumber;
    }
    
    void Account::setPhoneNumber(std::string number)
    {
        _phoneNumber = number;
    }
}
