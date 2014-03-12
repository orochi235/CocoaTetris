//
//  TetrisPieceView.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TetrisPieceView.h"

@implementation TetrisPieceView

@synthesize blockSize;
@synthesize delegate;

- (id)initWithFrame:(NSRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {        
        // TODO: view setup goes here
        NSLog(@"[TetrisPieceView initWithFrame:%f %f %f %f]", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        self.needsDisplay = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (int)determineBlockSize {
    // returns the width at which blocks will be drawn, based on the available space.
    int height = self.bounds.size.height;
    int width = self.bounds.size.width;
    int dimension = (height < width ? height : width) / 4;
    return dimension;
}

- (void)drawRect:(NSRect)dirtyRect
{
    TetrisPiece *piece = [delegate pieceForDrawing:self];
    
    NSLog(@"Draw called: %@", [delegate pieceForDrawing:self]);
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    int size;
    size = [self determineBlockSize];
    
    CGPoint center;
    center.x = self.bounds.size.width / 2;
    center.y = self.bounds.size.height / 2;
    
    CGPoint rectTopLeft;
    rectTopLeft.x = center.x - size * 2;
    rectTopLeft.y = center.y - size * 2;

    CGContextSetRGBFillColor (context, 1, 0, 0, 1);
    
    // handle null blocks array reference
    if (piece.blocks == nil) {
        NSAlert *theAlert = [[NSAlert alloc] init];
        theAlert.messageText = @"TetrisPieceView::DrawRect - blocks array is nil";
        [theAlert runModal]; // Ignore return value.
    }
    
    // choose appropriate color based on state number
    int colorIndex = piece.stateNumber / 4;
    
    CGContextSetRGBFillColor (context, colorIndex & 1, colorIndex >> 1 & 1, colorIndex >> 2 & 1, 1);
/*    CGRect bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);  
    CGContextFillRect (context, bounds);

    return;*/
    
    for (int i = 0; i < 4; i++) {
        
        int x = [[delegate pieceForDrawing:self].blocks xOfIndex:i];
        int y = [[delegate pieceForDrawing:self].blocks yOfIndex:i];
                
        CGPoint location;
        location.x = rectTopLeft.x + x * size;
        location.y = rectTopLeft.y + y * size;

        CGRect bounds = CGRectMake(location.x, location.y, size, size);
        CGContextFillRect (context, bounds);        
    }
    
    // inform controller that we've redrawn
    [delegate pieceViewDidUpdate:self];
}

@end
