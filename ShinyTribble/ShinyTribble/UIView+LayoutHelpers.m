//
//  UIView+LayoutHelpers.m
//  ShinyTribble
//
//  Created by Ariel Rodriguez on 3/30/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "UIView+LayoutHelpers.h"

@implementation UIView (LayoutHelpers)
- (NSLayoutConstraint *)vb_widthConstraint
{
    
    NSLayoutConstraint *widthConstraint = nil;
    
    for ( NSLayoutConstraint *c in [self constraints] ) {
        
        if ( [c firstAttribute] == NSLayoutAttributeWidth ) {
            
            widthConstraint = c;
            break;
            
        }
        
    }
    
    return widthConstraint;
    
}

- (NSLayoutConstraint *)vb_heightConstraint
{
    
    NSLayoutConstraint *heightConstraint = nil;
    
    for ( NSLayoutConstraint *c in [self constraints] ) {
        
        if ( [c firstAttribute] == NSLayoutAttributeHeight ) {
            
            heightConstraint = c;
            break;
            
        }
        
    }
    
    return heightConstraint;
    
}
@end
