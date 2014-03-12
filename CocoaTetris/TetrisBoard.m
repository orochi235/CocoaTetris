//
//  TetrisBoard.m
//  CocoaTetris
//
//  Created by Michael Baker on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/* AN EXPLANATION OF COORDINATE SYSTEMS:
   
   Objects referencing this one will use the external coordinate system, in
    which the origin is the top-left cell of the grid.
 
   The class itself has to map to a 2d NSArray of cells, in which the row is 
    specified before the column.
 
   Translating from external to internal: external(x,y) -> internal(y,x)
 
 */


#import "TetrisBoard.h"


@implementation TetrisBoard

@synthesize height, width;

- (id)init {
    return [self initWithWidth:CT_DEFAULT_BOARD_WIDTH 
                        Height:CT_DEFAULT_BOARD_HEIGHT];
}

- (id)initWithWidth:(int)w Height:(int)h {
    self = [super init];
    if (self) {
        height = h;
        width = w;
        
        // initialize our map
        NSMutableArray *temp;
        temp = [NSMutableArray arrayWithCapacity:self.width];
        for (int i = 0; i < width; i++) {
            [temp addObject:nil];
        }
        NSArray *emptyRow = [NSArray arrayWithArray:temp];

        // we now have an array containing an empty cell for each column in a row.
        //  let's stack them to make a grid:
        
        NSMutableArray *rows;
        rows = [NSMutableArray arrayWithCapacity:self.height];
        for (int i = 0; i < height; i++) {
            [rows addObject:[emptyRow copy]];
        }
        
        // TODO: This is redundant, but the original plan was to use a static NSArray
        map = [NSMutableArray arrayWithArray:rows];
        
    }
    
    return self;   
}

- (TetrisCell *)cellAtX:(int)x Y:(int)y {
    // returns the contents of the cell at (x,y).
    return [[map objectAtIndex:y] objectAtIndex:x];
}

- (void)setCellAtX:(int)x Y:(int)y To:(TetrisCell *)value {
    // makes the coordinate (x,y) contain the provided cell. 
    // no need to worry about object retention; NSArray should handle that.
    
    [[map objectAtIndex:y] replaceObjectAtIndex:x withObject:value];
    
}

- (void)dealloc {
    [super dealloc];
}

+ (TetrisBoard *) newBoard {
    // simple wrapper to provide height and width defaults
    return [TetrisBoard newBoardOfWidth:CT_DEFAULT_BOARD_WIDTH
                                 Height:CT_DEFAULT_BOARD_HEIGHT];
}

+ (TetrisBoard *) newBoardOfWidth:(int)w Height:(int)h {
    
    TetrisBoard *b = [[TetrisBoard alloc] initWithWidth:w Height:h];
    return b;
    
}

@end
