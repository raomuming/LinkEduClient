// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#pragma once

namespace ari {

class ILoginCallback {
public:
    virtual ~ILoginCallback() {}

    virtual void onLogin(bool success) = 0;
};

}  // namespace ari