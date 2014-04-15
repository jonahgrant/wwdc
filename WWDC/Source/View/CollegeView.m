//
//  CollegeView.m
//  WWDC
//
//  Created by Jonah Grant on 4/12/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "CollegeView.h"
#import "RoundedRadiusView.h"

@implementation CollegeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITextView *bioTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 0, 295, 240)];
        bioTextView.backgroundColor = [UIColor clearColor];
        bioTextView.textColor = [UIColor whiteColor];
        bioTextView.editable = NO;
        bioTextView.userInteractionEnabled = NO;
        bioTextView.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
        bioTextView.text = SCHOOL_COLLEGE;
        [self addSubview:bioTextView];

        UIImageView *boulderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 120)];
        boulderImageView.image = [UIImage imageNamed:@"boulder"];
        RoundedRadiusView *imageViewRoundedView = [[RoundedRadiusView alloc] initWithView:boulderImageView];
        imageViewRoundedView.center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, 160);
        [self addSubview:imageViewRoundedView];
        
        UIImageView *michiganImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 120)];
        michiganImageView.image = [UIImage imageNamed:@"michigan"];
        RoundedRadiusView *mapViewRoundedView = [[RoundedRadiusView alloc] initWithView:michiganImageView];
        mapViewRoundedView.center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, 290);
        [self addSubview:mapViewRoundedView];

    }
    return self;
}


@end
