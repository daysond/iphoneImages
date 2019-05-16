//
//  ViewController.m
//  IphoneImages
//
//  Created by Dayson Dong on 2019-05-16.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSURL *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.url = [NSURL URLWithString:@"http://imgur.com/bktnImE.png"];
    [self downloadImage];

}

-(void)downloadImage {
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:self.url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *iphoneImage = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iphoneImageView.image = iphoneImage;
        }];
    }];
    
    [downloadTask resume];
    
}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    
    int i = arc4random_uniform(5);
    
    switch (i) {
        case 0:
            self.url = [NSURL URLWithString:@"http://imgur.com/bktnImE.png"];
            break;
        case 1:
            self.url = [NSURL URLWithString:@"http://imgur.com/zdwdenZ.png"];
            break;
        case 2:
            self.url = [NSURL URLWithString:@"http://imgur.com/CoQ8aNl.png"];
            break;
        case 3:
            self.url = [NSURL URLWithString:@"http://imgur.com/2vQtZBb.png"];
            break;
        case 4:
            self.url = [NSURL URLWithString:@"http://imgur.com/y9MIaCS.png"];
            break;
        default:
            break;
    }
    [self downloadImage];
}


@end
