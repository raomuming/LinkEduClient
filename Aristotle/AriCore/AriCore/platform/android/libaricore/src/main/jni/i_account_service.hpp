// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#pragma once

#include "../../../../../../src/gen/i_account_service.hpp"
#include "djinni_support.hpp"

namespace djinni_generated {

class IAccountService final : ::djinni::JniInterface<::ari::IAccountService, IAccountService> {
public:
    using CppType = std::shared_ptr<::ari::IAccountService>;
    using CppOptType = std::shared_ptr<::ari::IAccountService>;
    using JniType = jobject;

    using Boxed = IAccountService;

    ~IAccountService();

    static CppType toCpp(JNIEnv* jniEnv, JniType j) { return ::djinni::JniClass<IAccountService>::get()._fromJava(jniEnv, j); }
    static ::djinni::LocalRef<JniType> fromCppOpt(JNIEnv* jniEnv, const CppOptType& c) { return {jniEnv, ::djinni::JniClass<IAccountService>::get()._toJava(jniEnv, c)}; }
    static ::djinni::LocalRef<JniType> fromCpp(JNIEnv* jniEnv, const CppType& c) { return fromCppOpt(jniEnv, c); }

private:
    IAccountService();
    friend ::djinni::JniClass<IAccountService>;
    friend ::djinni::JniInterface<::ari::IAccountService, IAccountService>;

};

}  // namespace djinni_generated
