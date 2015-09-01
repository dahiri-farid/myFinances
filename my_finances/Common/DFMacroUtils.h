//
//  DFMacroUtils.h
//  my_finances
//
//  Created by Dahiri Farid on 7/4/15.
//  Copyright (c) 2015 Dahiri Farid. All rights reserved.
//

#ifndef DFMacroUtils_h
#define DFMacroUtils_h

#define DF_DECLARE_SINGLETON    + (instancetype)instance;

#define DF_DEPLOY_SINGLETON(ClassType)              \
+ (instancetype)instance                            \
{                                                   \
    static ClassType *sharedInstance = nil;         \
    static dispatch_once_t onceToken;               \
    dispatch_once(&onceToken, ^{                    \
        sharedInstance = [[self alloc] init];       \
    });                                             \
    return sharedInstance;                          \
}                                                   \

#define NilOrValue(val) [val isKindOfClass:NSNull.class] ? nil : val


#endif
