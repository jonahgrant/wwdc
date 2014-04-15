//
//  CellCollectionLayout.h
//  WWDC
//
//  Created by Jonah Grant on 4/6/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellCollectionLayout : UICollectionViewLayout

@property (nonatomic, strong, readwrite) NSIndexPath *selectedIndexPath;

@end
