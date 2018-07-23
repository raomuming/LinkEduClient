//
//  FileStorageProviderImpl.m
//  AriCore
//
//  Created by Eric Rao on 2018/7/23.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

#import "FileStorageProviderImpl.h"

@implementation FileStorageProviderImpl

- (NSString *)getDocumentPath:(nonnull NSString *)relative
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* path = ([paths count] > 0) ? [paths objectAtIndex:0] : @"";
    if (nil != relative && relative.length != 0)
        return [NSString stringWithFormat:@"%@/%@", path, relative];
    else
        return path;
}

@end
