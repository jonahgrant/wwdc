//
//  Cell.h
//  WWDC
//
//  Created by Jonah Grant on 4/5/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

@class Cell;

@protocol CellDelegate <NSObject>

- (void)cellShouldDeselect:(Cell *)cell;

@end

@interface Cell : UICollectionViewCell

@property (strong, nonatomic, readwrite) NSString *title, *detailTitle;
@property (nonatomic, assign, readwrite, getter = isDraggable) BOOL draggable;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) NSArray *screens;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic, weak, readwrite) id<CellDelegate> delegate;

- (void)setActive:(BOOL)isActive;

@end
