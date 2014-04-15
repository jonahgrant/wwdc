//
//  ProjectDescriptionView.m
//  WWDC
//
//  Created by Jonah Grant on 4/12/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "ProjectDescriptionView.h"
#import "ProjectModel.h"

@interface ProjectDescriptionView ()

@property (strong, nonatomic) ProjectModel *model;
@property (strong, nonatomic) UIButton *externalButton;

@end

@implementation ProjectDescriptionView

- (instancetype)initWithModel:(ProjectModel *)model {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.model = model;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 40)];
        titleLabel.text = self.model.name;
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0f];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        
        UITextView *descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 10, 280, 220)];
        descriptionView.text = self.model.description;
        descriptionView.backgroundColor = [UIColor clearColor];
        descriptionView.textColor = [UIColor whiteColor];
        descriptionView.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0f];
        descriptionView.editable = NO;
        descriptionView.userInteractionEnabled = NO;
        [self addSubview:descriptionView];
        
        _externalButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_externalButton setTitle:self.model.urlTitle forState:UIControlStateNormal];
        [_externalButton addTarget:self action:@selector(executeURL) forControlEvents:UIControlEventTouchUpInside];
        [_externalButton addTarget:self action:@selector(highlightButton) forControlEvents:UIControlEventTouchDown];
        [_externalButton addTarget:self action:@selector(unhighlightButton) forControlEvents:UIControlEventTouchCancel];
        [_externalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _externalButton.frame = CGRectMake(15, CGRectGetMaxY(descriptionView.frame) + 10, 280, 40);
        _externalButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _externalButton.layer.borderWidth = 2.0f;
        _externalButton.layer.cornerRadius = 5.0f;
        [self addSubview:_externalButton];
    }
    return self;
}

- (void)highlightButton {
    _externalButton.backgroundColor = [UIColor whiteColor];
    [_externalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)unhighlightButton {
    _externalButton.backgroundColor = [UIColor clearColor];
    [_externalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)executeURL {
    [self unhighlightButton];
    [[UIApplication sharedApplication] openURL:self.model.url];
}

@end
