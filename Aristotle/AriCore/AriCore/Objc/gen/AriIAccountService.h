// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from account.djinni

#import <Foundation/Foundation.h>
@protocol AriILoginCallback;


@interface AriIAccountService : NSObject

- (BOOL)isLoggedIn;

- (void)loginWithPhoneNumber:(nonnull NSString *)number
                    password:(nonnull NSString *)password
                    callback:(nullable id<AriILoginCallback>)callback;

- (void)signupWithPhoneNumber:(nonnull NSString *)number
                     password:(nonnull NSString *)password;

@end
