//
//  http_model.cpp
//  AriCore
//
//  Created by Eric Rao on 02/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "http_model.hpp"

namespace ari {
    HTTPModel::HTTPModel()
    : _object(new Object())
    {}
    
    std::string HTTPModel::toString()
    {
        std::ostringstream out;
        _object->stringify(out);
        
        return out.str();
    }
}
