//
//  CellModel.h
//  WWDC
//
//  Created by Jonah Grant on 4/7/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

@interface CellModel : NSObject

@property (strong, nonatomic, readonly) CAGradientLayer *backgroundGradient;
@property (copy, nonatomic, readonly) NSString *title, *detailTitle;
@property (strong, nonatomic, readonly) UIImage *image;
@property (strong, nonatomic, readonly) NSArray *views;

- (instancetype)initWithBackgroundGradient:(CAGradientLayer *)backgroundGradient
                                     title:(NSString *)title
                               detailTitle:(NSString *)detailTitle
                                     image:(UIImage *)image
                                     views:(NSArray *)views;

@end
