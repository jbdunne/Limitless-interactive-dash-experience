//
//  PTProcotol.h
//  IPG_osx_ios
//
//  Created by Gene Han on 3/31/15.
//  Copyright (c) 2015 ipg. All rights reserved.
//

#ifndef IPG_osx_ios_PTProcotol_h
#define IPG_osx_ios_PTProcotol_h

#import <Foundation/Foundation.h>
#include <stdint.h>

static const int PTProtocolIPv4PortNumber = 30000;

enum {
    PTFrameTypeDeviceInfo = 100,
    PTFrameTypeTextMessage = 101,
    PTFrameTypePing = 102,
    PTFrameTypePong = 103,
    PTFrameTypePlay = 104
};

typedef struct _PTTextFrame {
    uint32_t length;
    uint8_t utf8text[0];
} PTTextFrame;


static dispatch_data_t PTTextDispatchDataWithString(NSString *message) {
    // Use a custom struct
    const char *utf8text = [message cStringUsingEncoding:NSUTF8StringEncoding];
    size_t length = strlen(utf8text);
    PTTextFrame *textFrame = CFAllocatorAllocate(nil, sizeof(PTTextFrame) + length, 0);
    memcpy(textFrame->utf8text, utf8text, length); // Copy bytes to utf8text array
    textFrame->length = htonl(length); // Convert integer to network byte order
    
    // Wrap the textFrame in a dispatch data object
    return dispatch_data_create((const void*)textFrame, sizeof(PTTextFrame)+length, nil, ^{
        CFAllocatorDeallocate(nil, textFrame);
    });
}

#endif
