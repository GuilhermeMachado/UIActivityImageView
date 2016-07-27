//
//  UIActivityImageView.h
//
//  Created by Guilherme Machado on 7/21/16.
//

#import <UIKit/UIKit.h>

@interface UIActivityImageView : UIImageView

/**
 *  ** Default Properties **
 *
 *  default Style: UIActivityIndicatorViewStyleGray
 *  hidesWhenStopped: true
 */
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

/**
 *  Start the UIActivityIndicatorView
 */
- (void)startActivityIndicator;

/**
 *  Stop the UIActivityIndicatorView
 *  Automatic called when a image is 
 */
- (void)stopActivityIndicator;

@end
