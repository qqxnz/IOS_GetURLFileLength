//
//  GetURLFileLength.m
//  fileSize_test
//
//  Created by lv on 2018/11/7.
//  Copyright © 2018 lv. All rights reserved.
//

#import "GetURLFileLength.h"

@implementation GetURLFileLength

- (void)getUrlFileLength:(NSString *)url withResultBlock:(FileLength)block{
    _block = block;
    NSURL *nurl = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:nurl];
    ///gzip问题，，未验证
    [request setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
    
    // 自定义队列创建方法///
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:queue];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    [dataTask resume];;

}


- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{
    
    NSDictionary *dict = [(NSHTTPURLResponse *)response allHeaderFields];
    NSLog(@"%@",dict);
    NSNumber *length = [dict objectForKey:@"Content-Length"];
    if (_block) {
        _block([length integerValue], nil);
        // length单位是byte，除以1000后是KB（文件的大小计算好像都是1000，而不是1024），
    }
    
    /*
     NSURLSessionResponseCancel = 0,取消 默认
     NSURLSessionResponseAllow = 1, 接收
     NSURLSessionResponseBecomeDownload = 2, 变成下载任务
     NSURLSessionResponseBecomeStream        变成流
     */
    //    completionHandler(NSURLSessionResponseCancel); 获取头响应头后不执行其它操作了！！！
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"获取文件大小失败：%@",error);
    if (_block) {
        _block(0, error);
    }
}


@end
