//
//  VBTagsView.m
//  ShinyTribble
//
//  Created by Ariel Rodriguez on 3/30/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "VBTagsView.h"
#import "UIView+LayoutHelpers.h"
#import "NSLayoutConstraint+SelfInstall.h"

static const CGFloat kDefaultVerticalPad = 8.0;
static const CGFloat kDefaultHorizontalPad = 8.0;


@interface VBTagsView ()
@property (nonatomic, strong) NSArray *labels;
@property (nonatomic) CGFloat calculatedHeight;
@end

@implementation VBTagsView
+ (BOOL)requiresConstraintBasedLayout
{
    
    return YES;
    
}

- (id)initWithTags:(NSArray *)tags
{
    
    self = [super initWithFrame:CGRectZero];
    
    if ( self != nil ) {
        
        NSMutableArray *mutableLabels = [[NSMutableArray alloc] initWithCapacity:[tags count]];
        [tags enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            [self addSubview:label];
            [label setText:(NSString *)obj];
            [label setBackgroundColor:[UIColor lightGrayColor]];
            [label setTranslatesAutoresizingMaskIntoConstraints:NO];
            [label setContentHuggingPriority:UILayoutPriorityRequired
                                     forAxis:UILayoutConstraintAxisHorizontal];
            [label setContentCompressionResistancePriority:1000
                                                   forAxis:UILayoutConstraintAxisHorizontal];
            [label setContentCompressionResistancePriority:1000
                                                   forAxis:UILayoutConstraintAxisVertical];
            
            [mutableLabels addObject:label];
            
        }];
        
        [self setLabels:[mutableLabels copy]];
        
    }
    
    return self;
    
}

- (void)updateConstraints
{
    
    if ( !([self preferredMaxLayoutWidth] > 0.0) ) {
        
        [self setPreferredMaxLayoutWidth:CGFLOAT_MAX];
        
    }
    
    CGFloat width = [self preferredMaxLayoutWidth];
    
    CGFloat yOrigin = kDefaultVerticalPad;
    CGFloat xOrigin = kDefaultHorizontalPad;
    
    [self setCalculatedHeight:21.0];
    
    for ( UILabel *l in [self labels] ) {
        
        NSLayoutConstraint *labelWidthConstraint = [l vb_widthConstraint];
        CGFloat labelWidth = [labelWidthConstraint constant];
        
        if ( xOrigin + labelWidth + kDefaultHorizontalPad > width ) {
            
            xOrigin = kDefaultHorizontalPad;
            
            NSLayoutConstraint *heightConstraint = [l vb_heightConstraint];
            yOrigin += ([heightConstraint constant] + kDefaultVerticalPad);
            
            [self setCalculatedHeight:yOrigin+kDefaultVerticalPad];
            
        }
        
        NSLayoutConstraint *lxc = [NSLayoutConstraint constraintWithItem:l
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:xOrigin];
        [lxc vb_install];
        
        NSLayoutConstraint *lyc = [NSLayoutConstraint constraintWithItem:l
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:yOrigin];
        [lyc vb_install];
        
        xOrigin += (labelWidth + kDefaultHorizontalPad);
        
    }
    
    [super updateConstraints];
    
}

- (CGSize)intrinsicContentSize
{
    
    CGSize intrinsicContentSize = CGSizeMake([self preferredMaxLayoutWidth], [self calculatedHeight]);
    
    return intrinsicContentSize;
    
}

@end
