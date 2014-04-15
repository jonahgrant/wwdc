//
//  MasterViewController.m
//  WWDC
//
//  Created by Jonah Grant on 4/5/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterViewControllerModel.h"
#import "Cell.h"
#import "CellModel.h"
#import "ListCollectionLayout.h"
#import "CellCollectionLayout.h"

@interface MasterViewController () <CellDelegate>

@property (nonatomic, strong, readwrite) MasterViewControllerModel *model;
@property (nonatomic, strong, readwrite) ListCollectionLayout *listLayout;
@property (nonatomic, strong, readwrite) CellCollectionLayout *cellLayout;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [[MasterViewControllerModel alloc] init];
    
    self.listLayout = [[ListCollectionLayout alloc] init];
    self.cellLayout = [[CellCollectionLayout alloc] init];
    
    self.collectionView.collectionViewLayout = self.listLayout;
    self.collectionView.contentInset = UIEdgeInsetsMake(30.0f, 0.0f, 0.0f, 0.0f);
    self.collectionView.scrollIndicatorInsets = self.collectionView.contentInset;
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([Cell class]) bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"Cell"];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)updateCollectionViewWithLayout:(UICollectionViewLayout *)layout animated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.7f
                          delay:0.0f
         usingSpringWithDamping:3.0f
          initialSpringVelocity:0.01f
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut)
                     animations:^ {
                         [self.collectionView setCollectionViewLayout:layout animated:YES completion:completion];
                     } completion:nil];
}

- (void)cellShouldDeselect:(Cell *)cell {
    self.cellLayout.selectedIndexPath = nil;
    [self updateCollectionViewWithLayout:self.listLayout
                                animated:YES
                              completion:^(BOOL finished) {
                                  [self.collectionView reloadData];
                                  self.collectionView.scrollEnabled = YES;
                              }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.model.cellModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    CellModel *model = self.model.cellModels[indexPath.row];
        
    cell.gradientLayer = model.backgroundGradient;
    cell.title = model.title;
    cell.image = model.image;
    cell.detailTitle = model.detailTitle;
    cell.delegate = self;
    cell.screens = model.views;

    id layout = self.collectionView.collectionViewLayout;
    if ([layout isKindOfClass:[CellCollectionLayout class]]) {
        [cell setActive:YES];

        NSIndexPath *selectedIndexPath = [(CellCollectionLayout *)layout selectedIndexPath];
        
        if (selectedIndexPath && NSOrderedSame == [selectedIndexPath compare:indexPath]) {
            cell.draggable = YES;
        }
    } else {
        [cell setActive:NO];
        cell.draggable = NO;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    UICollectionViewLayout *layout;
    
    if (self.cellLayout.selectedIndexPath) {
        self.collectionView.scrollEnabled = YES;
        self.cellLayout.selectedIndexPath = nil;
        layout = self.listLayout;
    } else {
        self.collectionView.scrollEnabled = NO;
        self.cellLayout.selectedIndexPath = indexPath;
        layout = self.cellLayout;
    }
    
    [self updateCollectionViewWithLayout:layout animated:YES completion:^(BOOL finished) {
        [self.collectionView reloadData];
    }];
}

@end
