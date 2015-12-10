//
//  ViewController.m
//  NextCalculator
//
//  Created by Dima on 09/12/15.
//  Copyright © 2015 Dima. All rights reserved.
//

#import "ViewController.h"
#import "DTCalculator.h"

@interface ViewController ()

@property (strong, nonatomic) DTCalculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCalculator];
    [self preferredStatusBarStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Private Methods

- (void)setupCalculator {
    self.calculator = [[DTCalculator alloc] init];
}

#pragma mark - Actions

- (IBAction)digitAction:(UIButton *)sender {
    
    [self.clearButtonText setTitle:@"C" forState:UIControlStateNormal];
    self.display.text = [self.calculator numberToDisplay:sender.titleLabel.text];
    
}

- (IBAction)operationAction:(UIButton *)sender {
    
    NSString *string = [self.calculator performOperation:sender.tag];
    
    self.display.text = string;
    
}

- (IBAction)clearAction:(UIButton *)sender {
    if ([self.clearButtonText.titleLabel.text isEqual: @"C"]) {
        self.display.text = [self.calculator clearResult];
        [self.clearButtonText setTitle:@"AC" forState:UIControlStateNormal];
        
    } else {
        [self setupCalculator];
    }
}

- (IBAction)changeSignAction:(UIButton *)sender {
    
    self.display.text = [self.calculator changeSign];
}

- (IBAction)addDotAction:(UIButton *)sender {
    self.display.text = [self.calculator addDot];
}

- (IBAction)percentAction:(UIButton *)sender {
    
    self.display.text = [self.calculator convertToPercent];
}

@end
