//
//  ProjectModel.m
//  WWDC
//
//  Created by Jonah Grant on 4/9/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "ProjectModel.h"


@implementation ProjectModel

- (instancetype)initWithImage:(UIImage *)image
                   titleImage:(UIImage *)titleImage
                         name:(NSString *)name
                  description:(NSString *)description
                          url:(NSURL *)url
                     urlTitle:(NSString *)urlTitle {
    if (self = [super init]) {
        _image = image;
        _titleImage = titleImage;
        _name = name;
        _description = description;
        _url = url;
        _urlTitle = urlTitle;
    }
    return self;
}

@end
