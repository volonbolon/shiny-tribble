//
//  VBTagsView.h
//  ShinyTribble
//
//  Created by Ariel Rodriguez on 3/30/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBTagsView : UIView
@property(nonatomic) CGFloat preferredMaxLayoutWidth;
- (id)initWithTags:(NSArray *)tags;
@end
