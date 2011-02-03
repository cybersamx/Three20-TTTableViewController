//
//  ButtonCatalogViewController.m
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
#import "Global.h"

#import "ButtonCatalogViewController.h"


@implementation ButtonCatalogViewController

#pragma mark -
#pragma mark Override UIViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
  if (self = [super initWithNibName:nibName bundle:nibBundle]) {
    self.title = @"Button Touch Trigger Demo";
  }
  
  // Image.
  UIImage *image = TTIMAGE(@"bundle://Icon_Plus.png");
  self.tabBarItem = [[[UITabBarItem alloc]
                      initWithTitle:@"Button Touch"
                      image:image tag:0] autorelease];
  
  return self;
}

#pragma mark -
#pragma mark Override TTModelViewController

- (void) createModel {
  NSMutableArray *names = [Global names];
  NSMutableArray *items = [NSMutableArray arrayWithCapacity:names.count];
  
  for (NSString *name in names) {
    ContactViewCell *cell = [[ContactViewCell alloc] 
                             initWithName:name
                             target:self 
                             action:@selector(plusButtonDidPress:)];
    [items addObject:cell];
    [cell release];
  }
  
  self.dataSource = [TTListDataSource dataSourceWithItems:items];
}

#pragma mark -
#pragma mark Actions

- (void) plusButtonDidPress:(id)sender {
  // Load our custom menu view from a nib.
  NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MenuView" 
                                               owner:self options:nil];
  UIView* menuView = nil;
  for (id object in nib) {
    if ([object isKindOfClass:[UIView class]]) {
      // Retrieve the first UIView object.
      menuView = (UIView *) object;
    }
  }
  
  UIButton *plusButton = (UIButton *)sender;
  // Convert plusButton bounds to the the coordinate system of table view and
  // then get the cell containing the button.
  CGRect coord = [plusButton convertRect:plusButton.bounds toView:self.tableView];
  NSIndexPath *path = [self.tableView indexPathForRowAtPoint:coord.origin];
  TTTableViewCell* cell = (TTTableViewCell*) [self.tableView 
                                              cellForRowAtIndexPath:path]; 

  // Now call showMenu with the menu to display on the associated cell.
  [self showMenu:menuView forCell:cell animated:YES]; 
  
  /*
  ContactView *contactView = [sender superview];
  
  [self showMenu:menuView forCell:contactView animated:YES]; 
   */
}

@end
