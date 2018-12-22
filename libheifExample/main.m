//
//  main.m
//  libheifExample
//
//  Created by lizhuoli on 2018/12/21.
//

#import <Foundation/Foundation.h>
#import <libheif/libheif.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Decoder version: %s", heif_get_version());
    }
    return 0;
}
