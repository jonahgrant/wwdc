//
//  RoundedRadiusView.m
//  WWDC
//
//  Created by Jonah Grant on 4/9/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "RoundedRadiusView.h"

static NSUInteger const RADIUS = 5.0f;

@implementation RoundedRadiusView

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithFrame:CGRectMake(CGRectGetMinY(view.frame),
                                           CGRectGetMinX(view.frame),
                                           CGRectGetWidth(view.frame) + (RADIUS * 2),
                                           CGRectGetHeight(view.frame) + (RADIUS * 2))];
    if (self) {
        view.center = self.center;
        [self addSubview:view];
        
        view.layer.borderColor = [UIColor whiteColor].CGColor;
        view.layer.borderWidth = RADIUS;
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = RADIUS;
    }
    return self;
}


@end
