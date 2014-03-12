//
//  TetrisViewController.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// View controller for the app window

#import "AppViewController.h"

@implementation AppViewController
@synthesize shapeSlider, rotationSlider, myView;
@synthesize piece;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    piece = [[TetrisPiece alloc] init];
    
    // TEST: init piece view from here
    if (!myView) NSLog(@"myView hasn't been set.");
    [myView init];
    
    NSLog(@"Created piece (state number %d)", self.piece.stateNumber);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (TetrisPiece *)pieceForDrawing:(TetrisPieceView *)requestor {
    if (requestor == self.myView) {
        return piece;
    }
    
    [self updateUI]; // this seems like a convenient time to force a redraw
                     //  (mostly to update sliders on initial piece display)
    
    return nil;
}

- (void)pieceViewDidUpdate:(TetrisPieceView *)notifier {
    [self updateUI];
}

- (void)releaseOutlets {
    NSLog(@"AppViewController::releaseOutlets was called.");
    self.piece = nil;
    self.shapeSlider = nil;
    self.rotationSlider = nil;
    self.myView = nil;
}

- (IBAction)sliderChanged:(NSSlider *)sender {
    
    int shape = self.piece.stateNumber / 4;
    int rotation = self.piece.stateNumber % 4;
    
    if ([sender tag] == 0) {
        shape = [sender intValue];
    } else {
        rotation = [sender intValue];
    }

    int stateNumber = shape * 4 + rotation;
    self.piece.blocks = [TetrisPiece newCoordWithStateNumber:stateNumber];
    self.piece.stateNumber = stateNumber;
    [self updateUI];
}
/*
- (void)setPiece:(TetrisPiece *)piece {
    // TODO    
}
*/
- (void)updateUI {
    self.shapeSlider.intValue = self.piece.stateNumber / 4;
    self.rotationSlider.intValue = self.piece.stateNumber % 4;
    self.myView.needsDisplay = YES;
}

- (void)dealloc
{
    [self releaseOutlets];
    [piece release];
    [super dealloc];
}

@end
