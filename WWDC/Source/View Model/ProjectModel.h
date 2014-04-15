//
//  ProjectModel.h
//  WWDC
//
//  Created by Jonah Grant on 4/9/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

@interface ProjectModel : NSObject

@property (strong, nonatomic, readonly) UIImage *image, *titleImage;
@property (strong, nonatomic, readonly) NSString *name, *description, *urlTitle;
@property (strong, nonatomic, readonly) NSURL *url;

- (instancetype)initWithImage:(UIImage *)image
                   titleImage:(UIImage *)titleImage
                         name:(NSString *)name
                  description:(NSString *)description
                          url:(NSURL *)url
                     urlTitle:(NSString *)urlTitle;

@end
