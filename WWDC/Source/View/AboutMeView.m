//
//  AboutMeView.m
//  WWDC
//
//  Created by Jonah Grant on 4/9/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "AboutMeView.h"
#import "RoundedRadiusView.h"

static NSUInteger const IMAGE_WIDTH = 120;

@implementation AboutMeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IMAGE_WIDTH, IMAGE_WIDTH)];
        imageView.image = [UIImage imageNamed:@"jonah"];
        RoundedRadiusView *imageViewRoundedView = [[RoundedRadiusView alloc] initWithView:imageView];
        imageViewRoundedView.center = CGPointMake(80, 70);
        [self addSubview:imageViewRoundedView];
        
        UILabel *hiLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 50, 150, 28.0f)];
        hiLabel.text = ABOUT_ME_TITLE;
        hiLabel.textColor = [UIColor whiteColor];
        hiLabel.textAlignment = NSTextAlignmentCenter;
        hiLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:27.0f];
        [self addSubview:hiLabel];
        
        UITextView *bioTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxX(imageViewRoundedView.frame), 295, 200)];
        bioTextView.backgroundColor = [UIColor clearColor];
        bioTextView.textColor = [UIColor whiteColor];
        bioTextView.editable = NO;
        bioTextView.userInteractionEnabled = NO;
        bioTextView.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
        bioTextView.text = ABOUT_ME_BIO;
        [self addSubview:bioTextView];
    }
    return self;
}


@end
