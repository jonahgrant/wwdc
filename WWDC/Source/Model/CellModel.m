//
//  CellModel.m
//  WWDC
//
//  Created by Jonah Grant on 4/7/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

- (instancetype)initWithBackgroundGradient:(CAGradientLayer *)backgroundGradient
                                     title:(NSString *)title
                               detailTitle:(NSString *)detailTitle
                                     image:(UIImage *)image
                                     views:(NSArray *)views {
    if (self = [super init]) {
        _backgroundGradient = backgroundGradient;
        _title = title;
        _image = image;
        _detailTitle = detailTitle;
        _views = views;
    }
    return self;
}

@end
