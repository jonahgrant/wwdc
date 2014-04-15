//
//  JobView.m
//  WWDC
//
//  Created by Jonah Grant on 4/8/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "JobView.h"
#import "JobViewModel.h"

@implementation JobView

- (instancetype)initWithModel:(JobViewModel *)model {
    if (self = [super initWithFrame:CGRectMake(0, 0, 320, 400)]) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 140)];
        headerView.backgroundColor = [UIColor blackColor];
        [self addSubview:headerView];
        
        UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:headerView.frame];
        headerImageView.image = model.header;
        headerImageView.alpha = model.headerAlpha;
        headerImageView.contentMode = UIViewContentModeScaleAspectFit;
        [headerView addSubview:headerImageView];
        
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:headerView.frame];
        logoImageView.center = CGPointMake(self.center.x, 70);
        logoImageView.image = model.logo;
        logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:logoImageView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(headerView.frame) + 10, CGRectGetWidth(self.frame) - 30, 20.0f)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f];
        titleLabel.text = model.jobTitle;
        [self addSubview:titleLabel];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(titleLabel.frame), CGRectGetWidth(self.frame) - 30, 20.0f)];
        timeLabel.textColor = [UIColor whiteColor];
        timeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
        timeLabel.text = model.time;
        [self addSubview:timeLabel];
        
        UITextView *jobDescriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(10,
                                                                                          CGRectGetMaxY(timeLabel.frame) + 5,
                                                                                          CGRectGetWidth(self.frame) - 20,
                                                                                          200)];
        jobDescriptionTextView.backgroundColor = [UIColor clearColor];
        jobDescriptionTextView.textColor = [UIColor whiteColor];
        jobDescriptionTextView.font = [UIFont fontWithName:@"HelveticaNeue" size:13.0f];
        jobDescriptionTextView.text = model.description;
        jobDescriptionTextView.editable = NO;
        jobDescriptionTextView.userInteractionEnabled = NO;
        [self addSubview:jobDescriptionTextView];
    }
    return self;
}

@end
