//
//  JobViewModel.m
//  WWDC
//
//  Created by Jonah Grant on 4/8/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "JobViewModel.h"

@implementation JobViewModel

- (instancetype)initWithJobTitle:(NSString *)jobTitle
                     description:(NSString *)description
                            logo:(UIImage *)logo
                          header:(UIImage *)header
                     headerAlpha:(float)headerAlpha
                            time:(NSString *)time {
    if (self = [super init]) {
        _jobTitle = jobTitle;
        _logo = logo;
        _description = description;
        _header = header;
        _headerAlpha = headerAlpha;
        _time = time;
    }
    return self;
}

@end
