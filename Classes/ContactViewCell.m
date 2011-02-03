//
//  ContactView.m
//  ShowMenuDemo
//
//  Created by Samuel Chow on 2/2/11.
//  Copyright 2011 MobyFab. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in
//  any project, commercial or otherwise, entirely at your risk, with the
//  condition that any redistribution (in part or whole) of source code
//  must retain this copyright and permission notice. Attribution in
//  compiled projects is appreciated but not required.
//
//  Credits:
//  Includes Glyphish icons (licensed under Creative Commons 3.0 US license) 
//  by Joseph Wain - http://glyphish.com/
//

#import "ContactViewCell.h"


@implementation ContactViewCell

#pragma mark -
#pragma mark Override UIView

- (id) initWithName:(NSString *)name target:(id)target action:(SEL)action {
  if (self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)]) {
    TTImageView *imageView = [[TTImageView alloc] 
                              initWithFrame:CGRectMake(10.0f, 6.0f, 32.0f, 32.0f)];
    imageView.urlPath = @"bundle://Icon_User_Blue.png";
    [self addSubview:imageView];
    [imageView release];
    
    UILabel *label = [[UILabel alloc] 
             initWithFrame:CGRectMake(54.0f, 10.0f, 210.0f, 22.0f)];
    label.font = [UIFont boldSystemFontOfSize:17.0f];
    label.textColor = [UIColor blackColor];
    label.text = name;
    [self addSubview:label];
    [label release];
    
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusButton.frame = CGRectMake(268.0f, 6.0f, 32.0f, 32.0f);
    [plusButton setImage:TTIMAGE(@"bundle://Icon_Plus_Small_Blue.png")
                     forState:UIControlStateNormal];
    [plusButton showsTouchWhenHighlighted];
    [plusButton addTarget:target action:action 
         forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusButton];
  }
  
  return self;
}

@end
