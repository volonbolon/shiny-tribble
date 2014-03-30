//
//  VBViewController.m
//  ShinyTribble
//
//  Created by Ariel Rodriguez on 3/26/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "VBViewController.h"
#import "NSLayoutConstraint+SelfInstall.h"
#import "VBTagsView.h"

@interface VBViewController ()
@end

@implementation VBViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *v = [self view];
    
    NSString *str = @"We shall say 'Ni' again to you, if you do not appease us. Oh! Come and see the violence inherent in the system! Help, help, I'm being repressed! I am your king. Oh! Come and see the violence inherent in the system! Help, help, I'm being repressed! And this isn't my nose. This is a false one. I have to push the pram a lot.";
    NSArray *array = [str componentsSeparatedByString:@" "];
    
    VBTagsView *tagsView = [[VBTagsView alloc] initWithTags:array];
    [v addSubview:tagsView];
    [tagsView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tagsView setPreferredMaxLayoutWidth:[[self view] bounds].size.width];
    
    NSLayoutConstraint *tvxc = [NSLayoutConstraint constraintWithItem:tagsView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:v
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.0
                                                             constant:0.0];
    [tvxc vb_install];
    
    NSLayoutConstraint *tvyc = [NSLayoutConstraint constraintWithItem:tagsView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:v
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.0
                                                             constant:0.0];
    [tvyc vb_install];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
