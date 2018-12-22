//
//  main.m
//  libde265Example
//
//  Created by lizhuoli on 2018/12/1.
//  Copyright © 2018 SDWebImage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libde265/libde265.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Decoder version: %s", de265_get_version());
    }
    return 0;
}
