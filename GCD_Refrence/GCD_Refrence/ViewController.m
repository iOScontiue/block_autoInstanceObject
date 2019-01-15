//
//  ViewController.m
//  GCD_Refrence
//
//  Created by 卢育彪 on 2019/1/15.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    Person *per = [[Person alloc] init];
    __weak Person *weakPer = per;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)NSEC_PER_SEC*1), dispatch_get_main_queue(), ^{
        NSLog(@"%@", weakPer);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)NSEC_PER_SEC*2), dispatch_get_main_queue(), ^{
            NSLog(@"%@", weakPer);
        });
    });
    
    NSLog(@"touchesBegan");
}


@end
