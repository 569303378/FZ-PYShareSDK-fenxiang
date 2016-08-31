//
//  ViewController.m
//  PYShareSDK
//
//  Created by Apple on 16/8/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) NSString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)button:(UIButton *)sender {
    [self PYstr];
    


}
- (void)PYstr {
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"1.jpg"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://hc31.aipai.com/user/403/44947403/7813513/card/38059815/38059815_800fix.jpg"]）
    
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        //用客户端分享
        //        [shareParams SSDKEnableUseClientShare];
        NSString *sinaContent = @"分享内容";
        [shareParams SSDKSetupShareParamsByText:sinaContent
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://www.baidu.com/"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];


        //分享
        [ShareSDK showShareEditor:SSDKPlatformTypeSinaWeibo otherPlatformTypes:nil shareParams:shareParams onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
            //拼接上用户分享的内容
            NSString *s = [NSString stringWithFormat:@"%@http://www.jianshu.com https://www.baidu.com", shareParams[@"text"]];
            [shareParams setValue:s forKey:@"text"];
            
            if (state == SSDKResponseStateSuccess) {
                NSLog(@"成功");
            } else if (state == SSDKResponseStateFail) {
                NSLog(@"失败");
            }
            
        }];
    
    }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
