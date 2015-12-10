//
//  CalcBrain.h
//  calculatorTest
//
//  Created by Dima on 09/12/15.
//  Copyright © 2015 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTCalculator : NSObject

@property (strong, nonatomic) NSString *result;

@property (assign, nonatomic) double tempNumber;
@property (assign, nonatomic) NSInteger operation;
@property (assign, nonatomic) BOOL resultSet;
@property (assign, nonatomic) BOOL negativeSign;

- (NSString *)numberToDisplay:(NSString *)buttonNumber;
- (NSString *)performOperation:(NSInteger)operation;
- (NSString *)changeSign;
- (NSString *)addDot;
- (NSString *)clearResult;
- (NSString *)convertToPercent;


@end
