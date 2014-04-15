//
//  CellCollectionLayout.m
//  WWDC
//
//  Created by Jonah Grant on 4/6/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "CellCollectionLayout.h"

@implementation CellCollectionLayout

- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.bounds.size;
    UIEdgeInsets inset = self.collectionView.contentInset;
    size.height -= (inset.top + inset.bottom - 1.0);
    
    return size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems {
    [super prepareForCollectionViewUpdates:updateItems];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [NSMutableArray array];
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    for (int idx = 0; idx < items; ++idx) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
        UICollectionViewLayoutAttributes *attribute;
        attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [attributes addObject:attribute];
    }
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger items = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    UICollectionViewLayoutAttributes *attributes;
    attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.size = CGSizeMake(CGRectGetWidth(self.collectionView.bounds) - 4.0f, 450.0f);
    
    CGRect frame = CGRectZero;
    frame.origin.x = 2;
    
    frame.size = CGSizeMake(attributes.size.width, attributes.size.height);

    if (self.selectedIndexPath && NSOrderedSame == [indexPath compare:self.selectedIndexPath]) {
        frame.origin.y = 0.0f;
    } else {
        frame.origin.y = [self collectionViewContentSize].height - 58.0f;
        
        NSInteger rowOffset = (self.selectedIndexPath.row > indexPath.row) ? indexPath.row + 1 : indexPath.row;
        frame.origin.y -= 5.0f * (items - (rowOffset * 2));
    }
    
    attributes.frame = frame;
    
    attributes.bounds = CGRectMake(0.0f, 0.0f, attributes.size.width, attributes.size.height);
    attributes.alpha = 1.0f;
    attributes.zIndex = indexPath.row;
    
    return attributes;
}

@end
