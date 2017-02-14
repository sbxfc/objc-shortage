//
//  K2AllocationsViewController.m
//  Instruments
//
//  Created by sbxfc on 17/2/13.
//  Copyright © 2017年 site.ok2. All rights reserved.
//

#import "K2AllocationsViewController.h"
#import "UIImageView+PINRemoteImage.h"


@interface K2AllocationsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView8;
@property (weak, nonatomic) IBOutlet UIImageView *imageView7;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView9;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;

@end

@implementation K2AllocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self reload:NULL];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reload:(id)sender {
    [_reloadButton setEnabled:NO];
    
    _imageView1.image = nil;
    _imageView2.image = nil;
    _imageView3.image = nil;
    _imageView4.image = nil;
    _imageView5.image = nil;
    _imageView6.image = nil;
    _imageView7.image = nil;
    _imageView8.image = nil;
    _imageView9.image = nil;
    
    for (NSUInteger i = 0; i < 9; i++) {
        [self reloadSlowImage:i];
    }
    
//    for (NSUInteger i = 0; i < 9; i++) {
//        [self reloadFastImage:i];
//    }
    
    [_reloadButton setEnabled:YES];

}
-(void)reloadSlowImage:(NSUInteger)index{
    NSString* str = [NSString stringWithFormat:@"http://www.xmcgraw.com/pets/png/siberian%lu.png",(unsigned long)index];
    NSURL* url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    switch (index) {
        case 1:
            _imageView1.image = [UIImage imageWithData:data];
            break;
        case 2:
            _imageView2.image = [UIImage imageWithData:data];
            break;
        case 3:
            _imageView3.image = [UIImage imageWithData:data];
            break;
        case 4:
            _imageView4.image = [UIImage imageWithData:data];
            break;
        case 5:
            _imageView5.image = [UIImage imageWithData:data];
            break;
        case 6:
            _imageView6.image = [UIImage imageWithData:data];
            break;
        case 7:
            _imageView7.image = [UIImage imageWithData:data];
            break;
        case 8:
            _imageView8.image = [UIImage imageWithData:data];
            break;
        case 9:
            _imageView9.image = [UIImage imageWithData:data];
            break;
            
        default:
            break;
    }
}


-(void)reloadFastImage:(NSUInteger)index{
    NSString* str = [NSString stringWithFormat:@"http://www.xmcgraw.com/pets/png/siberian%lu.png",(unsigned long)index];
    NSURL* url = [NSURL URLWithString:str];
    switch (index) {
        case 1:
            [self.imageView1 pin_setImageFromURL:url];
            break;
        case 2:
            [self.imageView2 pin_setImageFromURL:url];
            break;
        case 3:
            [self.imageView3 pin_setImageFromURL:url];
            break;
        case 4:
            [self.imageView4 pin_setImageFromURL:url];
            break;
        case 5:
            [self.imageView5 pin_setImageFromURL:url];
            break;
        case 6:
            [self.imageView6 pin_setImageFromURL:url];
            break;
        case 7:
            [self.imageView7 pin_setImageFromURL:url];
            break;
        case 8:
            [self.imageView8 pin_setImageFromURL:url];
            break;
        case 9:
            [self.imageView9 pin_setImageFromURL:url];
            break;
            
        default:
            break;
    }
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
