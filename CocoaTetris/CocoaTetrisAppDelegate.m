//
//  CocoaTetrisAppDelegate.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaTetrisAppDelegate.h"
#import "TetrisPiece.h"
#import "AppViewController.h"

@implementation CocoaTetrisAppDelegate

@synthesize window, controller;

- (id)init
{
    NSLog(@"init called");
    self = [super init];
    if (self) {
        self.controller = [[AppViewController alloc] initWithNibName:@"TetrisPieceView" bundle:nil];
        // N.B.: we use self.property so it's automatically retained if necessary
    }
    return self; 
}

- (void)awakeFromNib {
    NSLog(@"awakeFromNib called. Initializing *p");
    // Insert code here to initialize your application
    TetrisPiece *p;
    p = [TetrisPiece newRandomShape];
    controller.piece = p;
    
    NSArray *subviews = [[self.window contentView] subviews];
    //    self.controller.rotationSlider = [[self.window contentView] 
    NSLog(@"subviews list: %@", subviews);
    //    self.controller.myView = [subviews objectAtIndex:2];
    
}

@end
