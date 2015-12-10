//
//  CalcBrain.m
//  calculatorTest
//
//  Created by Dima on 09/12/15.
//  Copyright © 2015 Dima. All rights reserved.
//

#import "DTCalculator.h"

@implementation DTCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.result = @"0";
        self.tempNumber = 0;
        self.operation = 0;
        self.resultSet = NO;
        self.negativeSign = NO;
    }
    return self;
}

- (NSString *)numberToDisplay:(NSString *)buttonNumber {
    
    //BOOL dotButton = [buttonNumber isEqualToString:@","];
    
    if (self.resultSet == YES) {
        self.result = @"0";
        self.resultSet = NO;
    }
    
    if ([self.result isEqualToString:@"0"]) {
        self.result = [NSString stringWithString:buttonNumber];
        
    } else if ([self.result isEqualToString:@"-0"]) {
        self.result = [NSString stringWithFormat:@"-%@", buttonNumber];
        
    } else {
        self.result = [self.result stringByAppendingString:buttonNumber];
    }
    
    return self.result;
}

- (NSString *)performOperation:(NSInteger)operation {
    
    self.result = [self.result stringByReplacingOccurrencesOfString:@"," withString:@"."];
    
    switch (self.operation) {
        case 10:
            self.tempNumber = self.tempNumber / [self.result doubleValue];
            self.result = [NSString stringWithFormat:@"%f", self.tempNumber];
            break;
        case 11:
            self.tempNumber = self.tempNumber * [self.result doubleValue];
            self.result = [NSString stringWithFormat:@"%f", self.tempNumber];
            break;
        case 12:
            self.tempNumber = self.tempNumber - [self.result doubleValue];
            self.result = [NSString stringWithFormat:@"%f", self.tempNumber];
            break;
        case 13:
            self.tempNumber = self.tempNumber + [self.result doubleValue];
            self.result = [NSString stringWithFormat:@"%f", self.tempNumber];
            break;
        default:
            break;
    }
    
    self.operation = operation;
    
    self.tempNumber = [self.result floatValue];
    self.resultSet = YES;
    
    if ([self.result isEqual:@"inf"]) {
        return @"Error";
    } else {
        NSString *string = [NSString stringWithFormat:@"%lg", self.tempNumber];
        string = [string stringByReplacingOccurrencesOfString:@"." withString:@","];
        return string;
    }
}

- (NSString *)addDot {
    if (![self.result containsString:@","]) {
        self.result = [self.result stringByAppendingFormat:@","];
    }
    
    return self.result;
}

- (NSString *)clearResult {
    self.result = @"0";
    return self.result;
}

- (NSString *)changeSign {
    
    double result = [self.result doubleValue];
    
    result = -result;
    
    self.result = [NSString stringWithFormat:@"%g", result];
    
    return self.result;
}

-(NSString *) convertToPercent {
    
    double result = [self.result doubleValue];
    
    if (result != 0) {
        result = self.tempNumber * (result / 100);
        
    } else {
        result /= 100;
    }
    
    self.result = [NSString stringWithFormat:@"%g", result];
    self.result = [self.result stringByReplacingOccurrencesOfString:@"." withString:@","];
    return self.result;
}

@end
