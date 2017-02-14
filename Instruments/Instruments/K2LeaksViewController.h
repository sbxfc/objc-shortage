//
//  K2LeaksViewController.h
//  Instruments
//
//  Created by sbxfc on 17/2/14.
//  Copyright © 2017年 site.ok2. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Object2;
@class Object1;

@interface Object2 : NSObject
@property (strong, nonatomic) Object1 *object;
- (instancetype)init;
@end

@interface Object1 : NSObject
@property (strong, nonatomic) Object2 *object;
- (instancetype)init;
@end



@interface K2LeaksViewController : UIViewController

@end
