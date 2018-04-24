#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "XCNetworking.h"
#import "XCNetworkStatus.h"

FOUNDATION_EXPORT double XCNetworkingVersionNumber;
FOUNDATION_EXPORT const unsigned char XCNetworkingVersionString[];

