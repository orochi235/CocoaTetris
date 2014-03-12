//
//  CocoaTetrisAppDelegate.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CocoaTetrisAppDelegate.h"
#import "TetrisPiece.h"
#import "TetrisViewController.h"

@implementation CocoaTetrisAppDelegate

@synthesize window, controller;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    TetrisPiece *p;
    p = [TetrisPiece newShape:L withRotation:ZERO];
    [p retain];
    
    self.controller = [[TetrisViewController alloc] initWithNibName:@"TetrisPieceView" bundle:nil];
	
	// [myWindowController showWindow:self];
    
    self.controller.piece = p;
    NSArray *subviews = [[self.window contentView] subviews];
    //    self.controller.rotationSlider = [[self.window contentView] 
    NSLog([NSString stringWithFormat:@"subviews list: %@", subviews]);
}

@end
