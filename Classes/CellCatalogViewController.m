//
//  CellCatalogViewController.m
//  ShowMenuDemo
//
//  Created by Samuel Chow on 2/3/11.
//  Copyright 2011 MobyFab. All rights reserved.
//
//  Credits:
//  Includes Glyphish icons (licensed under Creative Commons 3.0 US license) 
//  by Joseph Wain - http://glyphish.com/
//

#import "Global.h"

#import "CellCatalogViewController.h"


@implementation CellCatalogViewController

#pragma mark -
#pragma mark Override UIViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
  if (self = [super initWithNibName:nibName bundle:nibBundle]) {
    self.title = @"Cell Touch Trigger Demo";
    
    // Image.
    UIImage *image = TTIMAGE(@"bundle://Icon_Target.png");
    self.tabBarItem = [[[UITabBarItem alloc]
                        initWithTitle:@"Cell Touch"
                        image:image tag:0] autorelease];
  }
  
  return self;
}

#pragma mark -
#pragma mark Override TTModelViewController

- (void) createModel {
  NSMutableArray *names = [Global names];
  NSMutableArray *items = [NSMutableArray arrayWithCapacity:names.count];
  
  static NSString *imageURL = @"bundle://Icon_User_Blue.png";
  
  for (NSString *name in names) {
    [items addObject:[TTTableImageItem itemWithText:name
                                           imageURL:imageURL]];
  }
  
  self.dataSource = [TTListDataSource dataSourceWithItems:items];
}

#pragma mark -
#pragma mark Actions

// By default, Three20 navigator will open the view indicated by the table item
// url value. To prevent this behavior, we override this method.

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath*)path {
  TTTableViewCell* cell = (TTTableViewCell*) [self.tableView 
                                              cellForRowAtIndexPath:path]; 
  
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
  
  // Now call showMenu with the menu to display on the associated cell.
  [self showMenu:menuView forCell:cell animated:YES]; 
  
}

@end

