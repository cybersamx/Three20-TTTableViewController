//
//  SwipeCatalogViewController.m
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
//  Some portion of the code is based on Nirav Savjani's code (originally 
//  posted on Three20 discussion thread on Google Groups.
//  http://groups.google.com/group/three20/browse_thread/thread/67bb19879746cea5
//


#import "Global.h"

#import "SwipeCatalogViewController.h"


@implementation SwipeCatalogViewController

#pragma mark -
#pragma mark Override UIViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
  if (self = [super initWithNibName:nibName bundle:nibBundle]) {
    self.title = @"Swipe Trigger Demo";
    
    // Image.
    UIImage *image = TTIMAGE(@"bundle://Icon_Zap.png");
    self.tabBarItem = [[[UITabBarItem alloc]
                        initWithTitle:@"Swipe"
                        image:image tag:0] autorelease];
  }
  
  return self;
}

- (void) viewDidLoad {
  // Register the swipe gesture.
  UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] 
                                          initWithTarget:self 
                                          action:@selector(swipeDidOccur:)];
  [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight | 
                            UISwipeGestureRecognizerDirectionLeft)]; 
  [self.view addGestureRecognizer:recognizer]; 
  [recognizer release]; 

  [super viewDidLoad]; 
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

- (void) swipeDidOccur:(UISwipeGestureRecognizer *)recognizer { 
  // Get the start point so that we can do a hit test on the table view.
  CGPoint startPoint = [recognizer locationInView:self.tableView];
  NSIndexPath *path = [self.tableView indexPathForRowAtPoint:startPoint];
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
