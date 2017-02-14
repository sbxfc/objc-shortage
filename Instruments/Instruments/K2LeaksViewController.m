//
//  K2LeaksViewController.m
//  Instruments
//
//  Created by sbxfc on 17/2/14.
//  Copyright © 2017年 site.ok2. All rights reserved.
//

#import "K2LeaksViewController.h"

@implementation Object1

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object1 is being deinitialized");
    }
    return self;
}

@end

@implementation Object2

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object2 is being deinitialized");
    }
    return self;
}

@end

@interface K2LeaksViewController ()

@end

@implementation K2LeaksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Object1* obj1 = [Object1 new];
    Object2* obj2 = [Object2 new];
    
    obj1.object = obj2;
    obj2.object = obj1;
    
    obj1 = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
