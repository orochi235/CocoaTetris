//
//  TetrisBoardView.h
//  CocoaTetris
//
//  Created by Michael Baker on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TetrisBoard.h"

@class TetrisBoardView;

@protocol TetrisBoardViewDelegate
- (TetrisBoard *)boardForDrawing:(TetrisBoardView *)requestor;
- (void)boardViewDidUpdate:(TetrisBoardView *)notifier;
@end

@interface TetrisBoardView : NSView {
@private
    
}

@property (retain) IBOutlet id <TetrisBoardViewDelegate> delegate;

@end
