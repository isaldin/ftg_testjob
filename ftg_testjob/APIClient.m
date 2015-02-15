//
//  APIClient.m
//  ftg_testjob
//
//  Created by il.ya sald.in on 2/15/15.
//  Copyright (c) 2015 sald.in. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

+ (id)sharedClient
{
    static APIClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self alloc] init];
    });
    return sharedClient;
}

- (id)init
{
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{@"Authentication": @"Token 7f477a3d29a4f6b46b04c95ed5f48c26_1423742194_2392"};
    
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api.findthegang.com/api/v1/"] sessionConfiguration:sessionConfiguration];
    
    [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    return self;
}

- (void)postEventInfoWithParams:(NSDictionary *)params andSuccessHandler:(APIClientFetchSuccessHandler)postEventSuccessHandler
{
    [self POST:@"event" parameters:params success:postEventSuccessHandler failure:^(NSURLSessionDataTask *task, NSError *error) {
    }];
}
@end
