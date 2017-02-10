//
//  K2TimeProfileViewController.m
//  Instruments
//
//  Created by sbxfc on 17/2/10.
//  Copyright © 2017年 site.ok2. All rights reserved.
//

#import "K2TimeProfileViewController.h"

@interface K2TimeProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end



@implementation K2TimeProfileViewController
{
    NSMutableArray* _numberList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.statusLabel setText:@"Generating random numbers"];
    
    __weak typeof(self) weakSelf = self;
    [self sessionStep:^(NSString* msg){
        [weakSelf.statusLabel setText:msg];
    }];
}

-(void)sessionStep:(void(^)(NSString* msg))print{
    
    __weak typeof(self) weakSelf = self;
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t queue = dispatch_queue_create(NULL,NULL);//串行队列
    dispatch_async(queue, ^{
        
        [NSThread sleepForTimeInterval:5];
        
        [weakSelf generateRandomNumbers:500];
        
        dispatch_async(mainQueue,^{
            print(@"Insertion Sort");
        });
        
        [self insertionSort];
        
        dispatch_async(mainQueue,^{
            print(@"Done. Generating new numbers");
        });
    });
    
    
    dispatch_async(queue, ^{
        
        [weakSelf generateRandomNumbers:500];
        
        dispatch_async(mainQueue,^{
            print(@"Bubble Sort");
        });
        
        [self bubbleSort];
        
        dispatch_async(mainQueue,^{
            print(@"Done");
        });
    });
}

- (void)generateRandomNumbers:(NSUInteger)total {
    _numberList = @[].mutableCopy;
    for (NSUInteger i = 0; i < total; i++) {
        NSInteger rand = arc4random() % 100000;
        [_numberList addObject:@(rand)];
    }
}

- (void)insertionSort {
    
    NSMutableArray* unsortedArray = _numberList;
    long count = unsortedArray.count;
    int x,y;
    for (x=1; x<count; x++)
    {
        y = x;
        while(y > 0 &&
              [[unsortedArray objectAtIndex:(y-1)] intValue] > [[unsortedArray objectAtIndex:y] intValue])
        {
            [unsortedArray exchangeObjectAtIndex:y withObjectAtIndex:(y - 1)];
            y = y - 1;
        }
    }
    _numberList = unsortedArray.mutableCopy;

}

- (void)bubbleSort{
    NSMutableArray* unsortedArray = _numberList;
    for (NSInteger i=0; i<unsortedArray.count; i++) {
        for (NSInteger j=0; j<unsortedArray.count-1-i; j++) {
            if ([unsortedArray[j] integerValue] > [unsortedArray[j+1] integerValue]) {
                [unsortedArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    _numberList = unsortedArray.mutableCopy;

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
