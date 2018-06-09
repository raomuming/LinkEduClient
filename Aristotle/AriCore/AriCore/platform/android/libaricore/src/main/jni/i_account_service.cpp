// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#include "i_account_service.hpp"  // my header
#include "Marshal.hpp"
#include "i_login_callback.hpp"

namespace djinni_generated {

IAccountService::IAccountService() : ::djinni::JniInterface<::ari::IAccountService, IAccountService>("com/linkedu/core/IAccountService$CppProxy") {}

IAccountService::~IAccountService() = default;


CJNIEXPORT void JNICALL Java_com_linkedu_core_IAccountService_00024CppProxy_nativeDestroy(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        delete reinterpret_cast<::djinni::CppProxyHandle<::ari::IAccountService>*>(nativeRef);
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, )
}

CJNIEXPORT jboolean JNICALL Java_com_linkedu_core_IAccountService_00024CppProxy_native_1isLoggedIn(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        const auto& ref = ::djinni::objectFromHandleAddress<::ari::IAccountService>(nativeRef);
        auto r = ref->isLoggedIn();
        return ::djinni::release(::djinni::Bool::fromCpp(jniEnv, r));
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, 0 /* value doesn't matter */)
}

CJNIEXPORT void JNICALL Java_com_linkedu_core_IAccountService_00024CppProxy_native_1loginWithPhoneNumber(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef, jstring j_number, jstring j_password, jobject j_callback)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        const auto& ref = ::djinni::objectFromHandleAddress<::ari::IAccountService>(nativeRef);
        ref->loginWithPhoneNumber(::djinni::String::toCpp(jniEnv, j_number),
                                  ::djinni::String::toCpp(jniEnv, j_password),
                                  ::djinni_generated::ILoginCallback::toCpp(jniEnv, j_callback));
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, )
}

CJNIEXPORT void JNICALL Java_com_linkedu_core_IAccountService_00024CppProxy_native_1signupWithPhoneNumber(JNIEnv* jniEnv, jobject /*this*/, jlong nativeRef, jstring j_number, jstring j_password)
{
    try {
        DJINNI_FUNCTION_PROLOGUE1(jniEnv, nativeRef);
        const auto& ref = ::djinni::objectFromHandleAddress<::ari::IAccountService>(nativeRef);
        ref->signupWithPhoneNumber(::djinni::String::toCpp(jniEnv, j_number),
                                   ::djinni::String::toCpp(jniEnv, j_password));
    } JNI_TRANSLATE_EXCEPTIONS_RETURN(jniEnv, )
}

}  // namespace djinni_generated
