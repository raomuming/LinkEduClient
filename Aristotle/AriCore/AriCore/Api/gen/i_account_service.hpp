// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#pragma once

#include <string>

namespace ari {

class IAccountService {
public:
    virtual ~IAccountService() {}

    virtual bool isLoggedIn() = 0;

    virtual void login() = 0;

    virtual void signupWithPhoneNumber(const std::string & number) = 0;
};

}  // namespace ari
