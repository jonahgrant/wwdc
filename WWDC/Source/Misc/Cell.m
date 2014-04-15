//
//  Cell.m
//  WWDC
//
//  Created by Jonah Grant on 4/5/14.
//  Copyright (c) 2014 Jonah Grant. All rights reserved.
//

#import "Cell.h"

@interface Cell () <UIScrollViewDelegate>

@property (nonatomic, strong, readwrite) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIPanGestureRecognizer *panGesture;
@property (nonatomic, assign, readwrite) CGPoint revertPoint;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation Cell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    
    self.scrollView.delegate = self;
    
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:21.0f];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.6f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
    
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 4);
    
    self.draggable = NO;
}

- (void)setScreens:(NSArray *)screens {
    if (screens.count > 0) {
        self.pageControl.numberOfPages = screens.count;

        [self.scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.scrollView.frame) * screens.count, CGRectGetHeight(self.scrollView.frame))];
        
        for (int i = 0, j = (int)screens.count; i < j; i++) {
            UIView *view = screens[i];
            view.frame = CGRectMake(CGRectGetWidth(self.scrollView.frame) * i, 10, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
            [self.scrollView addSubview:view];
        }
    }
}

- (void)setGradientLayer:(CAGradientLayer *)gradientLayer {
    gradientLayer.frame = self.bounds;
    [self.contentView.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setDetailTitle:(NSString *)detailTitle {
    self.detailTitleLabel.text = detailTitle;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)setActive:(BOOL)isActive {
    self.scrollView.userInteractionEnabled = isActive;
    
    if (!isActive) {
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    }
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (UIGestureRecognizerStateBegan == panGesture.state) {
        self.revertPoint = self.center;
    } else if (UIGestureRecognizerStateChanged == panGesture.state) {
        CGPoint touchPoint = [panGesture translationInView:self];
        CGPoint movedPoint = CGPointMake(self.center.x, self.center.y + touchPoint.y);
        
        self.center = movedPoint;
        [panGesture setTranslation:CGPointZero inView:self];
    } else if (100.0f < self.center.y - self.revertPoint.y) {
        [self cancelGestureToDeselection];
    } else {
        [self revertToPoint:self.revertPoint animated:YES];
    }
}

- (void)cancelGestureToDeselection {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cellShouldDeselect:)]) {
        [self.delegate cellShouldDeselect:self];
    } else{
        [self revertToPoint:self.revertPoint animated:YES];
    }
}

- (void)revertToPoint:(CGPoint)point animated:(BOOL)animated {
    [UIView animateWithDuration:animated ? 0.35f : 0.0f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.center = point;
                     } completion:nil];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGPathRef path = [self roundPathWithSize:self.bounds.size cornerRadius:8.0f].CGPath;
    self.layer.shadowPath = path;
    [self addSubview:self.contentView];
    
    self.contentView.frame = self.bounds;

    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.frame = self.bounds;
    mask.path = path;
    self.contentView.layer.mask = mask;
}

- (UIBezierPath *)roundPathWithSize:(CGSize)size cornerRadius:(CGFloat)radius {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, radius, 0.0f);
    CGPathAddLineToPoint(path, NULL, size.width - radius, 0.0f);
    CGPathAddArcToPoint(path, NULL, size.width, 0.0f, size.width, radius, radius);
    CGPathAddLineToPoint(path, NULL, size.width, size.height-radius);
    CGPathAddArcToPoint(path, NULL, size.width, size.height, size.width - radius, size.height, radius);
    CGPathAddLineToPoint(path, NULL, radius, size.height);
    CGPathAddArcToPoint(path, NULL, 0.0f, size.height, 0.0f, size.height - radius, radius);
    CGPathAddLineToPoint(path, NULL, 0.0f, radius);
    CGPathAddArcToPoint(path, NULL, 0.0f, 0.0f, radius, 0.0f, radius);
    CGPathCloseSubpath(path);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithCGPath:path];
    CGPathRelease(path);
    
    return bezierPath;
}

- (void)setDraggable:(BOOL)draggable {
    self.panGesture.enabled = draggable;
}

- (BOOL)isDraggable {
    return self.panGesture.enabled;
}

- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        _panGesture.enabled = YES;
        [self addGestureRecognizer:_panGesture];
    }
    
    return _panGesture;
}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

@end
