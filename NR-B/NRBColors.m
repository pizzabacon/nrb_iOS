//
//  NRBColors.m
//  NR-B
//
//  Created by Connie Qi on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import "NRBColors.h"

@implementation UIColor (NRBColors)



// Colors from http://flatuicolors.com/

+ (UIColor *)turquoiseColor {
    static UIColor *turquoiseColor;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        turquoiseColor = [UIColor colorWithRed:26.0 / 255.0
                                   green:188.0 / 255.0
                                    blue:156.0 / 255.0
                                   alpha:1.0];
    });
    
    return turquoiseColor;
}

+ (UIColor *)greenSeaColor {
    static UIColor *greenSeaColor;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        greenSeaColor = [UIColor colorWithRed:22.0 / 255.0
                                         green:160.0 / 255.0
                                          blue:133.0 / 255.0
                                         alpha:1.0];
    });
    
    return greenSeaColor;
}

@end

