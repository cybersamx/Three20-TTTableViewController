//
//  BaseCatalogViewController.m
//  ShowMenuDemo
//
//  Created by Samuel Chow on 5/4/11.
//  Copyright 2011 MobyFab. All rights reserved.
//

#import "BaseCatalogViewController.h"


@implementation BaseCatalogViewController

- (void) generateAlertView:(NSString *)message {
  UIAlertView *alertView = [[UIAlertView alloc]
                            initWithTitle:@"Alert" 
                            message:message 
                            delegate:self 
                            cancelButtonTitle:@"OK" 
                            otherButtonTitles:nil];
  [alertView show];
  [alertView release];  
}

- (IBAction) messageButtonDidPress:(id)sender {
  [self generateAlertView:@"Message button pressed"];
}

- (IBAction) emailButtonDidPress:(id)sender {
  [self generateAlertView:@"Email button pressed"];
}

- (IBAction) favButtonDidPress:(id)sender {
  [self generateAlertView:@"Favorite button pressed"];
}

- (IBAction) locateButtonDidPress:(id)sender {
  [self generateAlertView:@"Locate button pressed"];
}

@end
