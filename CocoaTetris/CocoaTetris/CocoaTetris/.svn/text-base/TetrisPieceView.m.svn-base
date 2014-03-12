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
    
    NSRunAlertPanel(@"Draw called", 
                    [NSString stringWithFormat:@"%@", [delegate pieceForDrawing:self]],
                    @"OK", nil, nil);
    
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
    
    NSArray *blocks = [delegate pieceForDrawing:self].blocks;
    
    
    // handle null blocks array reference
    if (blocks == nil) {
        NSAlert *theAlert = [[NSAlert alloc] init];
        theAlert.messageText = @"TetrisPieceView::DrawRect - rblocks array is nil";
        [theAlert runModal]; // Ignore return value.
        return;
    }
    
    for (int i = 0; i < 4; i++) {
        
        CGPoint location;
        NSValue *val = [blocks objectAtIndex:i];
        struct Coord *coord = (Coord*)val.value;
        location.x = rectTopLeft.x + coord->x * size;
        location.y = rectTopLeft.y + coord->y * size;
        //location.x = [delegate pieceForDrawing:self].stateNumber;
        //location.y = [delegate pieceForDrawing:self].stateNumber;
        
        CGRect bounds = CGRectMake(location.x, location.y, size, size);
        CGContextFillRect (context, bounds);        
    }
    
}

@end
