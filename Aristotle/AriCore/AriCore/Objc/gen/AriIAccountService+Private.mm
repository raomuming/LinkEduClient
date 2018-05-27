// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#import "AriIAccountService+Private.h"
#import "AriIAccountService.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface AriIAccountService ()

- (id)initWithCpp:(const std::shared_ptr<::ari::IAccountService>&)cppRef;

@end

@implementation AriIAccountService {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::ari::IAccountService>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::ari::IAccountService>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

- (BOOL)isLoggedIn {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->isLoggedIn();
        return ::djinni::Bool::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto IAccountService::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto IAccountService::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<AriIAccountService>(cpp);
}

}  // namespace djinni_generated

@end
