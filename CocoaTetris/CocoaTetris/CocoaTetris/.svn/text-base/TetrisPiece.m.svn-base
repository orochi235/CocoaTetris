//
//  TetrisPiece.m
//  CocoaTetris
//
//  Created by Michael Baker on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <stdlib.h>

#import "TetrisPiece.h"

/* ONE WAY OF HIDING METHODS

@interface TetrisPiece() { // private (hidden) methods go here
    
    - (TetrisPiece *)unpackCoordsFromShape:(PieceType)shape withRotation:(Rotation)rotation;
    
}
@end
 */

@implementation TetrisPiece

@synthesize height, width;
@synthesize blocks;
@synthesize stateNumber;

// using "nintendo rotation system"--http://tetris.wikia.com/wiki/Nintendo_Rotation_System
// map of rotation progression; sub-arrays proceed in order when rotated 90 degrees clockwise.
// each hex digit represents one row; high-order bit is on the left.
// spare rows and columns are placed on top and left, respectively.
//   (damn, this is more complicated than it sounds!)
int rotationMap[7][4] = { // enum order: I, O, L, J, T, Z, S
    {0x2222, 0x00F0, 0x2222, 0x00F0}, // I
    {0x0660, 0x0660, 0x0660, 0x0660}, // O
    {0x0071, 0x0226, 0x0470, 0x0322}, // L
    {0x0074, 0x0622, 0x0170, 0x0223}, // J
    {0x0072, 0x0262, 0x0270, 0x0232}, // T
    {0x0063, 0x0132, 0x0063, 0x0132}, // Z
    {0x0036, 0x0231, 0x0036, 0x0231}  // S
};

- (id) init {
    // no arguments = pick a random shape and rotation
    int state = arc4random() % 28;
    return [self initWithStateNumber:state];
}

- (id) initWithShape:(PieceType)shape withRotation:(Rotation)rotation {
    int state = shape * 4 + rotation;
    return [self initWithStateNumber:state];
}

- (id)initWithStateNumber:(int)seed {
    /* DEFAULT INITIALIZER */
    
    seed %= 28; // bounds-check seed value
    
    self = [super init];
    if (self) {
        self.stateNumber = seed;
        self.blocks = [TetrisPiece newCoordArrayWithStateNumber:seed];
    }
    
    return self;            
}

- (void)invert {
    int shape = stateNumber / 4;
    int rotation = stateNumber % 4;
    
    rotation = (stateNumber + 2) % 4;
    self.stateNumber = shape * 4 + rotation;
    [self.blocks release];
    self.blocks = [TetrisPiece newCoordArrayWithStateNumber:self.stateNumber];
}

- (void)rotateCCW {
    int shape = stateNumber / 4;
    int rotation = stateNumber % 4;
    
    rotation = (stateNumber + 3) % 4;
    self.stateNumber = shape * 4 + rotation;
    [self.blocks release];
    self.blocks = [TetrisPiece newCoordArrayWithStateNumber:self.stateNumber];    
}

- (void)rotateCW {
    int shape = stateNumber / 4;
    int rotation = stateNumber % 4;
    
    rotation = (stateNumber + 1) % 4;
    self.stateNumber = shape * 4 + rotation;
    [self.blocks release];
    self.blocks = [TetrisPiece newCoordArrayWithStateNumber:self.stateNumber];

}

+ (NSArray *) newCoordArrayWithStateNumber:(int)state {
    int pattern = rotationMap[state / 4][state % 4];
    int arrayIndex = 0;
    
    Coord c[4];
    
    for (int i = 0; i < 4; i++) {
        int row = (pattern >> (4 * i)) & 0xF;
        for (int j = 0; j < 4; j++) {
            if ((row >> j) & 1) {
                c[arrayIndex].x = j;
                c[arrayIndex].y = i;
                arrayIndex++;
            }
        }
    }
    
    NSArray *out = [NSArray arrayWithObjects:
                       [NSValue value:&c[0] withObjCType:@encode(Coord)],
                       [NSValue value:&c[1] withObjCType:@encode(Coord)],
                       [NSValue value:&c[2] withObjCType:@encode(Coord)],
                       [NSValue value:&c[3] withObjCType:@encode(Coord)],
                       nil];
    [out retain];
    return out;
    
}

+ (TetrisPiece *)newShape:(PieceType)shape withRotation:(Rotation)rotation {

    TetrisPiece *newPiece = [[TetrisPiece alloc] init];
    newPiece.stateNumber = shape * 4 + rotation;
    newPiece.blocks = [TetrisPiece newCoordArrayWithStateNumber:newPiece.stateNumber];
    return newPiece;
}


- (void)dealloc {
    [blocks release];
    [super dealloc];
}

@end
