//
//  K2TimeProfileImagesViewController.m
//  Instruments
//
//  Created by sbxfc on 17/2/10.
//  Copyright © 2017年 site.ok2. All rights reserved.
//

#import "K2TimeProfileImagesViewController.h"

@interface K2TimeProfileImagesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@end

@implementation K2TimeProfileImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self reload:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reload:(id)sender {
    self.image1.image = nil;
    self.image2.image = nil;
    self.image3.image = nil;
    
    [self loadSlowImage1];
    [self loadImage2];
    [self loadFastImage3];
}

-(void)loadSlowImage1{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.xmcgraw.com/pets/png/siberian12.png"]];
     self.image1.image = [UIImage imageWithData:data];
}

-(void)loadImage2{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"siberian16" ofType: @"png"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
       self.image2.image = [[UIImage alloc] initWithContentsOfFile:path];
    }

}

-(void)loadFastImage3{
    self.image3.image = [UIImage imageNamed:@"siberian18"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
