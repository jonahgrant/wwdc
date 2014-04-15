//
//  ProjectTitleView.m
//  WWDC
//
//  Created by Jonah Grant on 4/9/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "ProjectTitleView.h"
#import "ProjectModel.h"

@implementation ProjectTitleView

- (instancetype)initWithModel:(ProjectModel *)model {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, self.center.y, 212, 327)];
        imageView.image = model.image;
        [self addSubview:imageView];
        
        UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(imageView.frame) - 30, 212, 48)];
        titleImageView.image = model.titleImage;
        [self addSubview:titleImageView];
    }
    return self;
}

@end
