//
//  pal_impl.cpp
//  AriCore
//
//  Created by Eric Rao on 2018/7/23.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#include "../gen/pal.hpp"
#include "../gen/i_pal_bundle.hpp"

#include <mutex>

namespace ari {
    static std::shared_ptr<IPalBundle> s_palBundle = nullptr;
    
    void Pal::setPalBundle(const std::shared_ptr<IPalBundle> &bundle) {
        s_palBundle = bundle;
    }
    
    std::shared_ptr<IPalBundle> Pal::getPalBundle() {
        return s_palBundle;
    }
}
