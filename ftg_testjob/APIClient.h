//
//  APIClient.h
//  ftg_testjob
//
//  Created by il.ya sald.in on 2/15/15.
//  Copyright (c) 2015 sald.in. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

typedef void(^APIClientFetchSuccessHandler)(NSURLSessionDataTask *task, id responseObject);
typedef void(^APIClientFetchFailureHandler)(NSURLSessionDataTask *task, NSError *error);

@interface APIClient : AFHTTPSessionManager

+ (id)sharedClient;
- (id)init;

- (void)postEventInfoWithParams:(NSDictionary *)params andSuccessHandler:(APIClientFetchSuccessHandler)postEventSuccessHandler;

@end
