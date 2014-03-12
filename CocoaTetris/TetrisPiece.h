//
//  TetrisPiece.h
//  CocoaTetris
//
//  Created by Michael Baker on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisCoord.h"

typedef enum PieceType {
    I, O, L, J, T, Z, S
} PieceType;

typedef enum Rotation {
    ZERO, CW, HALF, CCW
} Rotation;

typedef struct Coord {
    int x, y;
} Coord;

@class TetrisPiece;

@interface TetrisPiece : NSObject {

@private
    TetrisCoord* blocks;    
    int height;
    int width;
    int stateNumber;
}

- (id)init;
- (id)initWithShape:(PieceType)shape withRotation:(Rotation)rotation;
- (id)initWithStateNumber:(int)seed;
- (void)invert;
- (void)rotateCCW;
- (void)rotateCW;

+ (NSArray *)newCoordArrayWithStateNumber:(int)state;
+ (TetrisCoord *)newCoordWithStateNumber:(int)state;
+ (TetrisPiece *)newRandomShape;
+ (TetrisPiece *)newShape:(PieceType)shape withRotation:(Rotation)rotation;

@property(readonly) int height;
@property(readonly) int width;
@property int stateNumber;
@property(retain) TetrisCoord* blocks;

@end