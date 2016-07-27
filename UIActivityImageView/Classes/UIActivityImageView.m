//
//  UIActivityImageView.m
//
//  Created by Guilherme Machado on 7/21/16.
//

#import "UIActivityImageView.h"

@interface UIActivityImageView()

@property (nonatomic) NSArray *activityPositionCenterConstraints;
@property (nonatomic) NSLayoutConstraint *xCenterConstraint;
@property (nonatomic) NSLayoutConstraint *yCenterConstraint;

@end

@implementation UIActivityImageView

- (void)awakeFromNib {

    [self createActivityIndicator];
    
}

- (void)setImage:(UIImage *)image {

    [super setImage:image];

    if (image) {
        [self stopActivityIndicator];
    }
    
}

#pragma mark - Private

- (void)createActivityIndicator {
    
    self.activityIndicator = [UIActivityIndicatorView new];
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false;
    
    [self addSubview:self.activityIndicator];

    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    self.activityIndicator.hidesWhenStopped = true;

    self.xCenterConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    self.yCenterConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    self.activityPositionCenterConstraints = @[self.xCenterConstraint,self.yCenterConstraint];
    
    [self addConstraints:self.activityPositionCenterConstraints];
    
}

#pragma mark - Public

- (void)startActivityIndicator {
    [self.activityIndicator startAnimating];
}

- (void)stopActivityIndicator {
    [self.activityIndicator stopAnimating];
}

@end
