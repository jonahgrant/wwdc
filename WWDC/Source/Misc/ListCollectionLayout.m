//
//  ListCollectionLayout.m
//  WWDC
//
//  Created by Jonah Grant on 4/6/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "ListCollectionLayout.h"

static double const INHERITANCE = 0.25;

@implementation ListCollectionLayout

- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.bounds.size;
    UIEdgeInsets inset = self.collectionView.contentInset;
    size.height -= (inset.top + inset.bottom - 1.0);
    
    return size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems {
    [super prepareForCollectionViewUpdates:updateItems];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    
    NSInteger sections = self.collectionView.numberOfSections;
    for (int section = 0; section < sections; ++section) {
        NSInteger items = [self.collectionView numberOfItemsInSection:section];
        for (int idx = 0; idx < items; ++idx) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
            UICollectionViewLayoutAttributes *attribute;
            attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
            [attributes addObject:attribute];
        }
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger items = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    UICollectionViewLayoutAttributes *attributes;
    attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.size = CGSizeMake(CGRectGetWidth(self.collectionView.bounds) - 4, 450.0f);
    
    CGRect frame = CGRectZero;
    frame.origin.x = 2;
    frame.origin.y = (75 - 100 / items) * indexPath.row;
    
    CGRect bounds = self.collectionView.bounds;
    if (CGRectGetMinY(bounds) < 0) {
        if (indexPath.item == 0) {
            frame.origin.y = CGRectGetMinY(bounds) * INHERITANCE / 2.0;
        } else {
            frame.origin.y -= CGRectGetMinY(bounds) * indexPath.item * INHERITANCE;
        }
    } else if (CGRectGetMinY(frame) < CGRectGetMinY(bounds)) {
        frame.origin.y = bounds.origin.y;
    }
    
    frame.size = attributes.size;
    
    attributes.frame = frame;
    attributes.bounds = CGRectMake(0.0f, 0.0f, attributes.size.width, attributes.size.height);
    attributes.zIndex = indexPath.row;
    
    return attributes;
}

@end
