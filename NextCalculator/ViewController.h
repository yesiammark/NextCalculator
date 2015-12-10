//
//  ViewController.h
//  NextCalculator
//
//  Created by Dima on 09/12/15.
//  Copyright © 2015 Dima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UIButton *clearButtonText;

- (IBAction)digitAction:(UIButton *)sender;
- (IBAction)operationAction:(UIButton *)sender;
- (IBAction)clearAction:(UIButton *)sender;
- (IBAction)changeSignAction:(UIButton *)sender;
- (IBAction)addDotAction:(UIButton *)sender;
- (IBAction)percentAction:(UIButton *)sender;

@end

