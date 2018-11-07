//
//  ViewController.m
//  fileSize_test
//
//  Created by lv on 2018/11/7.
//  Copyright © 2018 lv. All rights reserved.
//

#import "ViewController.h"
#import "GetURLFileLength.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSLog(@"%@",[NSThread currentThread]);

    GetURLFileLength * getLength = [[GetURLFileLength alloc] init];

    [getLength getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0287.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
        NSLog(@"%ld",length);
        NSLog(@"%@",[NSThread currentThread]);
    }];


    [get getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0189.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
        NSLog(@"%ld",length);
        NSLog(@"%@",[NSThread currentThread]);
    }];

//
//    [get getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0221.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
//        NSLog(@"%ld",length);
//        NSLog(@"%@",[NSThread currentThread]);
//    }];
//
//    [get getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0226.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
//        NSLog(@"%ld",length);
//        NSLog(@"%@",[NSThread currentThread]);
//    }];
//
//    [get getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0242.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
//        NSLog(@"%ld",length);
//        NSLog(@"%@",[NSThread currentThread]);
//    }];
//
//    [get getUrlFileLength:@"http://media.igetwell.cn/ofit_pro_media/video/ACT0240.mp4" withResultBlock:^(NSInteger length, NSError * _Nonnull error) {
//        NSLog(@"%ld",length);
//        NSLog(@"%@",[NSThread currentThread]);
//    }];
//
//
    
    
}


@end
