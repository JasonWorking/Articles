//
//  ViewController.m
//  DeallocDemo
//
//  Created by Jason Kaer on 15/6/24.
//  Copyright (c) 2015年 Jason Kaer. All rights reserved.
//

#import "ViewController.h"

@interface ClassFoo : NSObject
@end

@implementation ClassFoo

- (void)dealloc
{
    NSLog(@"dealloc is excuted in thread : %@, object : %@", [NSThread currentThread], self);
}

@end



@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _array = [NSMutableArray array];
    ClassFoo *objectFoo = [[ClassFoo alloc] init];
    NSLog(@"Thread: %@, object : %@", [NSThread currentThread],objectFoo);
    [_array addObject:objectFoo];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSThread currentThread] setName:@"DISPATCH_QUEUE_Thread_Custom"];
        [_array removeAllObjects];
    });
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_array removeAllObjects];
//    });
    
    
    
}


@end


