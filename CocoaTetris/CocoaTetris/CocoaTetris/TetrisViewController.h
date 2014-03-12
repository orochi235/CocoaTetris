//
//  TetrisViewController.h
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TetrisPiece.h"
#import "TetrisPieceView.h"

@interface TetrisViewController : NSViewController <TetrisPieceViewDelegate> {
    TetrisPiece *piece;
    NSSlider *shapeSlider;
    NSSlider *rotationSlider;
    TetrisPieceView *myView;
}

@property (retain) TetrisPiece *piece;
@property (retain) IBOutlet NSSlider *shapeSlider;
@property (retain) IBOutlet NSSlider *rotationSlider;
@property (retain) IBOutlet TetrisPieceView *myView;

- (IBAction)sliderChanged:(NSSlider *)sender;

- (TetrisPiece *)pieceForDrawing:(TetrisPieceView *)requestor;

- (void)releaseOutlets;
- (void)updateUI;

@end
