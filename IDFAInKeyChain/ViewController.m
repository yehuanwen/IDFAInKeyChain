//
//  ViewController.m
//  IDFAInKeyChain
//
//  Created by yhw on 17/3/15.
//  Copyright © 2017年 yhw. All rights reserved.
//

#import "ViewController.h"
#import "IDFAInKeyChain.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *idfaLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *IDFA = [IDFAInKeyChain IDFA];
    NSLog(@"IDFAInKeyChain = %@", IDFA);
    self.idfaLabel.text = IDFA;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
