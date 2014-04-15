//
//  SchoolView.m
//  WWDC
//
//  Created by Jonah Grant on 4/12/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

@import MapKit;

#import "SchoolView.h"
#import "RoundedRadiusView.h"

@implementation SchoolView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITextView *bioTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 0, 295, 240)];
        bioTextView.backgroundColor = [UIColor clearColor];
        bioTextView.textColor = [UIColor whiteColor];
        bioTextView.editable = NO;
        bioTextView.userInteractionEnabled = NO;
        bioTextView.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
        bioTextView.text = SCHOOL_HS;
        [self addSubview:bioTextView];
        
        /*Before a snowstorm my junior year which most nearby schools cancelled 48 hours in advance, mine didn't. To prank on my sister, I set up a form on my website to enter a phone number and have Twilio call the number and say it was a snow day.  I called her phone and she freaked out.  Thinking it was hilarious, I sent the URL to a friend.  Soon, everyone at my 5,000 student school thought there was a snow day (there wasn't).  I was suspended for a week for it and decided to go to SXSW while I was suspended. Mark Cuban said it was a "great story."*/
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 290, 140)];
        imageView.image = [UIImage imageNamed:@"newtrier"];
        RoundedRadiusView *imageViewRoundedView = [[RoundedRadiusView alloc] initWithView:imageView];
        imageViewRoundedView.center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, 130);
        [self addSubview:imageViewRoundedView];
        
        MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 290, 120)];
        mapView.userInteractionEnabled = NO;
        RoundedRadiusView *mapViewRoundedView = [[RoundedRadiusView alloc] initWithView:mapView];
        mapViewRoundedView.center = CGPointMake(CGRectGetWidth(self.frame) / 2.0, 280);
        [self addSubview:mapViewRoundedView];
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = CLLocationCoordinate2DMake(42.09472359999999, -87.72052919999999);
        [mapView addAnnotation:annotation];
        
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.1;
        region.span = span;
        region.center = annotation.coordinate;
        [mapView setRegion:region];
    }
    return self;
}


@end
