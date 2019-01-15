//
//  main.m
//  MJ_TEST
//
//  Created by 卢育彪 on 2019/1/2.
//  Copyright © 2019年 luyubiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

//ARC
void test1()
{
    {
        Person *per = [[Person alloc] init];
        per.age = 10;
        ^{
            NSLog(@"age:%d", per.age);
        };
//        [per release];
    }
    
    NSLog(@"-------1");
}

typedef void(^MyBlock)(void);

//ARC
void test2()
{
    MyBlock block;
    
    {
        Person *per = [[Person alloc] init];
        per.age = 10;
        __weak Person *weakPer = per;
        block = ^{
            NSLog(@"age:%d", weakPer.age);
        };
//        [per release];
    }
    
    NSLog(@"-------1");
}

void test3()
{
    int age = 10;
    ^{
        NSLog(@"%d", age);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test1();
//        test2();
        test3();
    }
    return 0;
}


