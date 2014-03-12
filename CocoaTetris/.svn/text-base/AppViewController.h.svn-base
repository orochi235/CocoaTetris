//
//  AppViewController.h
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TetrisPiece.h"
#import "TetrisPieceView.h"

@interface AppViewController : NSViewController <TetrisPieceViewDelegate> {
    TetrisPiece *piece;
    NSSlider *shapeSlider;
    NSSlider *rotationSlider;
    TetrisPieceView *myView;
}

@property (retain) TetrisPiece *piece;
@property (assign) IBOutlet NSSlider *shapeSlider;
@property (assign) IBOutlet NSSlider *rotationSlider;
@property (assign) IBOutlet TetrisPieceView *myView;

- (IBAction)sliderChanged:(NSSlider *)sender;

- (TetrisPiece *)pieceForDrawing:(TetrisPieceView *)requestor;
- (void)pieceViewDidUpdate:(TetrisPieceView *)notifier;

- (void)releaseOutlets;
- (void)updateUI;

@end
