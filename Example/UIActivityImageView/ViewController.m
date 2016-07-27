//
//  ViewController.m
//  LoadingImageViewDemo
//
//  Created by Guilherme Machado on 7/25/16.
//
//

#import "ViewController.h"

#import <UIActivityImageView/UIActivityImageView.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIButton *loadImageButton;
@property (weak, nonatomic) IBOutlet UIActivityImageView *imageView;

@property (nonatomic) NSURL *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.url = [[NSURL alloc] initWithString:@"http://static.batanga.com.br/sites/default/files/mascotes_fail.jpg"];
    
}

- (IBAction)loadImage:(UIButton *)sender {
 
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(loadImage) userInfo:nil repeats:false];

    [self.imageView startActivityIndicator];

}

- (void)loadImage {

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               UIImage *image = [[UIImage alloc] initWithData:data];
                               
                               self.imageView.image = image;
                               
                               if (connectionError) {
                                   [self.imageView stopActivityIndicator];
                               }
                               
                           }];

}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    self.imageView.image = nil;
}

@end
