//
//  AriApplication.m
//  AriCore
//
//  Created by Eric Rao on 2018/7/23.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#import "AriApplication.h"
#import "PalBundleImpl.h"
#import "AriPal.h"

@implementation AriApplication

+ (void) initCore
{
    PalBundleImpl* palBundle = [[PalBundleImpl alloc] init];
    [AriPal setPalBundle:palBundle];
}

@end
