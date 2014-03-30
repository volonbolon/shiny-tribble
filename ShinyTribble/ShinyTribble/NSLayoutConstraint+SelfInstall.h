//
//  NSLayoutConstraint+SelfInstall.h
//  ShinyTribble
//
//  Created by Ariel Rodriguez on 3/28/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SelfInstall)
- (BOOL)vb_install;
- (BOOL)vb_install:(float)priority;
- (void)vb_remove;
@end
