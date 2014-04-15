//
//  JobViewModel.h
//  WWDC
//
//  Created by Jonah Grant on 4/8/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

@interface JobViewModel : NSObject

@property (strong, nonatomic, readonly) NSString *jobTitle, *description, *time;
@property (strong, nonatomic, readonly) UIImage *logo, *header;
@property (nonatomic, readonly) float headerAlpha;

- (instancetype)initWithJobTitle:(NSString *)jobTitle
                     description:(NSString *)description
                            logo:(UIImage *)logo
                          header:(UIImage *)header
                     headerAlpha:(float)headerAlpha
                            time:(NSString *)time;

@end
