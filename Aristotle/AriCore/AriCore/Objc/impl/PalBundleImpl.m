//
//  PalBundleImpl.m
//  AriCore
//
//  Created by Eric Rao on 2018/7/23.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#import "PalBundleImpl.h"
#import "FileStorageProviderImpl.h"

@implementation PalBundleImpl {
    FileStorageProviderImpl* m_fileStorageProvider;
}

- (instancetype) init {
    if (self = [super init]) {
        m_fileStorageProvider = [[FileStorageProviderImpl alloc] init];
    }
    
    return self;
}

- (id <AriIFileStorageProvider>) getFileStorageProvider
{
    return m_fileStorageProvider;
}

@end
