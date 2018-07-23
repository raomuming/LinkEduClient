// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from pal_bundle.djinni

#include "pal.hpp"
#include <memory>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@class AriPal;

namespace djinni_generated {

class Pal
{
public:
    using CppType = std::shared_ptr<::ari::Pal>;
    using CppOptType = std::shared_ptr<::ari::Pal>;
    using ObjcType = AriPal*;

    using Boxed = Pal;

    static CppType toCpp(ObjcType objc);
    static ObjcType fromCppOpt(const CppOptType& cpp);
    static ObjcType fromCpp(const CppType& cpp) { return fromCppOpt(cpp); }

private:
    class ObjcProxy;
};

}  // namespace djinni_generated

