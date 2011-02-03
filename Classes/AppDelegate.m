//
//  AppDelegate.m
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

#import <Three20/Three20.h>

#import "ButtonCatalogViewController.h"
#import "CellCatalogViewController.h"
#import "SwipeCatalogViewController.h"
#import "TabController.h"

#import "AppDelegate.h"

@implementation AppDelegate


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {  
  // Set up the navigator.
  TTNavigator* navigator = [TTNavigator navigator];
  navigator.opensExternalURLs = YES;
  
  TTURLMap* map = navigator.URLMap;
  [map from:@"*" toViewController:[TTWebController class]];
  
  [map from:@"demo://tabbar" toSharedViewController:[TabController class]];
  [map from:@"demo://swipeCatalog" toSharedViewController:[SwipeCatalogViewController class]];
  [map from:@"demo://buttonCatalog" toSharedViewController:[ButtonCatalogViewController class]];
  [map from:@"demo://cellCatalog" toSharedViewController:[CellCatalogViewController class]];
  
  if (![navigator restoreViewControllers]) {   
    [navigator openURLAction:[TTURLAction actionWithURLPath:@"demo://tabbar"]];    
  }
}

@end
