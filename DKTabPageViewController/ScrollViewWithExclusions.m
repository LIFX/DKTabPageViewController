//
//  Copyright (c) 2014 LIFX Labs. All rights reserved.
//

#import "ScrollViewWithExclusions.h"

@implementation ScrollViewWithExclusions

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL shouldExclude = NO;
    for (UIView *exclusionView in self.exclusionViews) {
        CGPoint localPoint = [self convertPoint:point toView:exclusionView];
        if (CGRectContainsPoint(exclusionView.bounds, localPoint)) {
            shouldExclude = YES;
            break;
        }
    }
    self.scrollEnabled = !shouldExclude;
    
    return [super hitTest:point withEvent:event];
}

@end
