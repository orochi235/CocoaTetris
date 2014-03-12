//
//  TetrisPieceView.h
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TetrisPiece.h"

@class TetrisPieceView;

@protocol TetrisPieceViewDelegate
- (TetrisPiece *)pieceForDrawing:(TetrisPieceView *)requestor;
@end

@interface TetrisPieceView : NSView {
@private
    NSColor *color;
    int blockSize;
    id <TetrisPieceViewDelegate> delegate;
}

- (int)determineBlockSize;

@property int blockSize;
@property (retain) id <TetrisPieceViewDelegate> delegate;

@end