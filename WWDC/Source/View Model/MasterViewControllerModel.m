//
//  MasterViewControllerModel.m
//  WWDC
//
//  Created by Jonah Grant on 4/7/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "MasterViewControllerModel.h"
#import "CellModel.h"
#import "JobViewModel.h"
#import "JobView.h"
#import "AboutMeView.h"
#import "ProjectModel.h"
#import "ProjectTitleView.h"
#import "ProjectDescriptionView.h"
#import "SchoolView.h"
#import "CollegeView.h"

@implementation MasterViewControllerModel

- (instancetype)init {
    if (self = [super init]) {
        AboutMeView *aboutMeView = [[AboutMeView alloc] init];
        
        CellModel *aboutMeCellModel = [[CellModel alloc] initWithBackgroundGradient:[self gradientWithStartColor:[UIColor colorWithRed:0.992157
                                                                                                                                 green:0.466667
                                                                                                                                  blue:0.133333
                                                                                                                                 alpha:1.0000]
                                                                                                        endColor:[UIColor colorWithRed:0.917072
                                                                                                                                 green:0.356324
                                                                                                                                  blue:0.103078
                                                                                                                                 alpha:1.0000]]
                                                                              title:ABOUT_CARD_TITLE
                                                                        detailTitle:ABOUT_CARD_DETAIL
                                                                              image:[UIImage imageNamed:@"user_male"]
                                                                              views:@[aboutMeView]];
        
        SchoolView *schoolView = [[SchoolView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        CollegeView *collegeView = [[CollegeView alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
        
        CellModel *schoolCellModel = [[CellModel alloc] initWithBackgroundGradient:[self gradientWithStartColor:[UIColor colorWithRed:0.239216
                                                                                                                                green:0.662745
                                                                                                                                 blue:0.109804
                                                                                                                                alpha:1.0000]
                                                                                                       endColor:[UIColor colorWithRed:0.191303
                                                                                                                                green:0.579759
                                                                                                                                 blue:0.083761
                                                                                                                                alpha:1.0000]]
                                                                             title:SCHOOL_CARD_TITLE
                                                                       detailTitle:SCHOOL_CARD_DETAIL
                                                                             image:[UIImage imageNamed:@"student_filled"]
                                                                             views:@[schoolView, collegeView]];

        JobViewModel *doejoModel = [[JobViewModel alloc] initWithJobTitle:DOEJO_TITLE
                                                              description:DOEJO_DESC
                                                                     logo:[UIImage imageNamed:@"doejo-logo"]
                                                                   header:[UIImage imageNamed:@"doejo-header"]
                                                              headerAlpha:0.4f
                                                                     time:DOEJO_DATES];
        JobView *doejoView = [[JobView alloc] initWithModel:doejoModel];

        JobViewModel *lightbankModel = [[JobViewModel alloc] initWithJobTitle:LIGHTBANK_TITLE
                                                                  description:LIGHTBANK_DESC
                                                                         logo:[UIImage imageNamed:@"lightbank-logo"]
                                                                       header:[UIImage imageNamed:@"lightbank-header"]
                                                                  headerAlpha:0.4f
                                                                         time:LIGHTBANK_DATES];
        JobView *lightbankView = [[JobView alloc] initWithModel:lightbankModel];

        JobViewModel *bellyModel = [[JobViewModel alloc] initWithJobTitle:BELLY_TITLE
                                                              description:BELLY_DESC
                                                                     logo:[UIImage imageNamed:@"belly-logo"]
                                                                   header:[UIImage imageNamed:@"belly-header"]
                                                              headerAlpha:0.17f
                                                                     time:BELLY_DATES];
        JobView *bellyView = [[JobView alloc] initWithModel:bellyModel];
        
        JobViewModel *modestModel = [[JobViewModel alloc] initWithJobTitle:MODEST_TITLE
                                                               description:MODEST_DESC
                                                                      logo:[UIImage imageNamed:@"modest-logo"]
                                                                    header:[UIImage imageNamed:@"modest-header"]
                                                               headerAlpha:0.4f
                                                                      time:MODEST_DATES];
        JobView *modestView = [[JobView alloc] initWithModel:modestModel];
        
        JobViewModel *twitterModel = [[JobViewModel alloc] initWithJobTitle:TWITTER_TITLE
                                                               description:TWITTER_DESC
                                                                      logo:[UIImage imageNamed:@"twitter-logo"]
                                                                     header:[UIImage imageNamed:@"twitter-header"]
                                                                headerAlpha:1.0f
                                                                       time:TWITTER_DATES];
        JobView *twitterView = [[JobView alloc] initWithModel:twitterModel];

        CellModel *workCellModel = [[CellModel alloc] initWithBackgroundGradient:[self gradientWithStartColor:[UIColor colorWithRed:0.698039
                                                                                                                              green:0.282353
                                                                                                                               blue:0.788235
                                                                                                                              alpha:1.0000]
                                                                                                     endColor:[UIColor colorWithRed:0.569950
                                                                                                                              green:0.151198
                                                                                                                               blue:0.675682
                                                                                                                              alpha:1.0000]]
                                                                           title:WORK_CARD_TITLE
                                                                     detailTitle:WORK_CARD_DETAIL
                                                                           image:[UIImage imageNamed:@"toolbox_filled"]
                                                                           views:@[twitterView, modestView, bellyView, lightbankView, doejoView]];
        
        ProjectModel *mbusModel = [[ProjectModel alloc] initWithImage:[UIImage imageNamed:@"mbus-screenshot"]
                                                           titleImage:[UIImage imageNamed:@"mbus-title"]
                                                                 name:MBUS_TITLE
                                                          description:MBUS_DESC
                                                                  url:[NSURL URLWithString:MBUS_URL]
                                                             urlTitle:MBUS_URL_TITLE];
        ProjectTitleView *mbusTitleView = [[ProjectTitleView alloc] initWithModel:mbusModel];
        ProjectDescriptionView *mbusDescriptionView = [[ProjectDescriptionView alloc] initWithModel:mbusModel];
        
        CellModel *projectsCellModel = [[CellModel alloc] initWithBackgroundGradient:[self gradientWithStartColor:[UIColor colorWithRed:0.152941
                                                                                                                                  green:0.141176
                                                                                                                                   blue:0.803922
                                                                                                                                  alpha:1.0000]
                                                                                                         endColor:[UIColor colorWithRed:0.103086
                                                                                                                                  green:0.000000
                                                                                                                                   blue:0.693698
                                                                                                                                  alpha:1.0000]]
                                                                               title:PROJECTS_CARD_TITLE
                                                                         detailTitle:PROJECTS_CARD_DETAIL
                                                                               image:[UIImage imageNamed:@"idea_filled"]
                                                                               views:@[mbusTitleView, mbusDescriptionView]];

        _cellModels = @[aboutMeCellModel, schoolCellModel, workCellModel, projectsCellModel];
    }
    return self;
}

- (CAGradientLayer *)gradientWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    return gradient;
}

@end
