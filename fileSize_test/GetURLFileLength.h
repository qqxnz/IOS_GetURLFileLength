//
//  GetURLFileLength.h
//  fileSize_test
//
//  Created by lv on 2018/11/7.
//  Copyright © 2018 lv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetURLFileLength : NSObject<NSURLSessionDataDelegate>

typedef void(^FileLength)(NSInteger length,  NSError * _Nullable error);
@property (nonatomic, copy) FileLength block;
- (void)getUrlFileLength:(NSString *)url withResultBlock:(FileLength)block;


@end

NS_ASSUME_NONNULL_END
