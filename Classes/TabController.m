//
//  TabController.m
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

#import "TabController.h"


@implementation TabController

#pragma mark -
#pragma mark UIViewController

- (void) viewDidLoad {
  [self setTabURLs:[NSArray arrayWithObjects:
                    @"demo://swipeCatalog",
                    @"demo://cellCatalog",
                    @"demo://buttonCatalog",
                    nil]];
  
  self.selectedIndex = 0;
  
  [super viewDidLoad];
}

@end
