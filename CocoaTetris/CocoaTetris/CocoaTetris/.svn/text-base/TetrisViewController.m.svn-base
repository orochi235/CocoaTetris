//
//  TetrisViewController.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// View controller for the app window

#import "TetrisViewController.h"

@implementation TetrisViewController

@synthesize shapeSlider, rotationSlider, myView;
@synthesize piece;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self.piece = [[TetrisPiece alloc] init];
    [self.piece retain];
    NSLog([NSString stringWithFormat:@"Created piece (state number %d)", self.piece.stateNumber]);
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.myView.delegate = self;
        [self updateUI];
    }
    
    return self;
}

- (TetrisPiece *)pieceForDrawing:(TetrisPieceView *)requestor {
    if (requestor == self.myView) {
        return piece;
    }
    return nil;
}

- (void)releaseOutlets {
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
    self.piece.blocks = [TetrisPiece newCoordArrayWithStateNumber:stateNumber];
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
