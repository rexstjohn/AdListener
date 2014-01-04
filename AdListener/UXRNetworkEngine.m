//
//  UXRNetworkEngine.m
//  AdListener
//
//  Created by Rex St. John on 1/3/14.
//  Copyright (c) 2014 UX-RX. All rights reserved.
//

#import "UXRNetworkEngine.h"

@implementation UXRNetworkEngine

/*
 
 AFHTTPRequestOperation
 
 AFHTTPRequestOperation is a subclass of AFURLConnectionOperation for requests using the HTTP or HTTPS protocols. It encapsulates the concept of acceptable status codes and content types, which determine the success or failure of a request.
 
 Although AFHTTPRequestOperationManager is usually the best way to go about making requests, AFHTTPRequestOperation can be used by itself.
 
 GET with AFHTTPRequestOperation
 
 NSURL *URL = [NSURL URLWithString:@"http://example.com/resources/123.json"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];
 AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
 op.responseSerializer = [AFJSONResponseSerializer serializer];
 [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 [[NSOperationQueue mainQueue] addOperation:op];
 Batch of Operations
 
 NSMutableArray *mutableOperations = [NSMutableArray array];
 for (NSURL *fileURL in filesToUpload) {
 NSURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
 [formData appendPartWithFileURL:fileURL name:@"images[]" error:nil];
 }];
 
 AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
 
 [mutableOperations addObject:operation];
 }
 
 NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:@[...] progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
 NSLog(@"%lu of %lu complete", numberOfFinishedOperations, totalNumberOfOperations);
 } completionBlock:^(NSArray *operations) {
 NSLog(@"All operations in batch complete");
 }];
 [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
 
 //////////
 
 
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 [manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 
 
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSDictionary *parameters = @{@"foo": @"bar"};
 [manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"JSON: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 
 
 AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
 NSDictionary *parameters = @{@"foo": @"bar"};
 NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
 [manager POST:@"http://example.com/resources.json" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
 [formData appendPartWithFileURL:filePath name:@"image" error:nil];
 } success:^(AFHTTPRequestOperation *operation, id responseObject) {
 NSLog(@"Success: %@", responseObject);
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 
 
 NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
 AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
 
 NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];
 
 NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
 NSURL *documentsDirectoryPath = [NSURL fileURLWithPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]];
 return [documentsDirectoryPath URLByAppendingPathComponent:[response suggestedFilename]];
 } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
 NSLog(@"File downloaded to: %@", filePath);
 }];
 [downloadTask resume];
 
 
 Request Serialization
 
 Request serializers create requests from URL strings, encoding parameters as either a query string or HTTP body.
 
 NSString *URLString = @"http://example.com";
 NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
 Query String Parameter Encoding
 
 [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters];
 GET http://example.com?foo=bar&baz[]=1&baz[]=2&baz[]=3
 URL Form Parameter Encoding
 
 [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters];
 POST http://example.com/
 Content-Type: application/x-www-form-urlencoded
 
 foo=bar&baz[]=1&baz[]=2&baz[]=3
 JSON Parameter Encoding
 
 [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters];
 POST http://example.com/
 Content-Type: application/json
 
 {"foo": "bar", "baz": [1,2,3]}
 
 
 Network Reachability Manager
 
 AFNetworkReachabilityManager monitors the reachability of domains, and addresses for both WWAN and WiFi network interfaces.
 
 Shared Network Reachability
 
 [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
 NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
 }];
 HTTP Manager with Base URL
 
 When a baseURL is provided, network reachability is scoped to the host of that base URL.
 
 NSURL *baseURL = [NSURL URLWithString:@"http://example.com/"];
 AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
 
 NSOperationQueue *operationQueue = manager.operationQueue;
 [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
 switch (status) {
 case AFNetworkReachabilityStatusReachableViaWWAN:
 case AFNetworkReachabilityStatusReachableViaWiFi:
 [operationQueue setSuspended:NO];
 break;
 case AFNetworkReachabilityStatusNotReachable:
 default:
 [operationQueue setSuspended:YES];
 break;
 }
 */

@end
