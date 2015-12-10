//
//  CalcBrain.h
//  calculatorTest
//
//  Created by Dima on 09/12/15.
//  Copyright © 2015 Dima. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DTMathOps) {
    
    DTMathOpsDivide = 10,
    DTMathOpsMultiply,
    DTMathOpsSubtract,
    DTMathOpsAdd
    
};

@interface DTCalculator : NSObject

@property (strong, nonatomic) NSString *result;

@property (assign, nonatomic) double tempNumber;
@property (assign, nonatomic) DTMathOps operation;
@property (assign, nonatomic) BOOL resultSet;
@property (assign, nonatomic) BOOL negativeSign;

- (NSString *)numberToDisplay:(NSString *)buttonNumber;
- (NSString *)performOperation:(DTMathOps)operation;
- (NSString *)changeSign;
- (NSString *)addDot;
- (NSString *)clearResult;
- (NSString *)convertToPercent;


@end
