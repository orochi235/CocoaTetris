//
//  TetrisCoord.m
//  CocoaTetris
//
//  Created by Michael Baker on 5/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TetrisCoord.h"

/***********************************************************
 
 Stores four sets of coordinates in a 16-bit int.
 Acceptable values for each coordinate component are 0-3.
 
 bit ---------------------------
 F E D C B A 9 8 7 6 5 4 3 2 1 0
 
  Y3  X3  Y2  X2  Y1  X1  Y0  X0
 coord -------------------------
 
 */

@implementation TetrisCoord

@synthesize intValue = bits;

- (id)init {
    
    self = [super init];
    if (self) {
        bits = 0;
    }
    
    return self;
}

- (void)setIndex:(int)index ToX:(int)x Y:(int)y {
    
    int trimmedX = x % 4;
    int trimmedY = y % 4;
    int offset = (index % 4) * 4;
    
    // rawBits will hold just this index's representation, but in the right place overall
    int rawBits = 0;
    rawBits = ((trimmedY << 2) | trimmedX) << offset;
    
    int clearMask = ~(0xF << offset);
    bits &= clearMask; // out with the old...
    bits |= rawBits; // ...and in with the new
}

- (int)xOfIndex:(int)index {
    int offset = (index % 4) * 4;
    return (bits >> offset) & 0x3;
}

- (int)yOfIndex:(int)index {
    int offset = (index % 4) * 4 + 2;
    return (bits >> offset) & 0x3;
}


- (void)dealloc {
    [super dealloc];
}

+ (NSArray *) newArrayFromCoords:(TetrisCoord *)c {
    // allocates and returns a 4-element NSArray, each element of which is a 2-element NSArray containing NSNumber representations of coords
    // NOTE: probably really, really inefficient.
    
    // pack coords in a temporary int array
    int temp[8];
    for (int i = 0; i <= 3; i++) {
        temp[i * 2]     = [c xOfIndex:i];
        temp[i * 2 + 1] = [c yOfIndex:i];
    }
    
    NSArray *out = [NSArray arrayWithObjects:
                     [NSArray arrayWithObjects:
                      [NSNumber numberWithInt:temp[0]],
                      [NSNumber numberWithInt:temp[1]],
                      nil],
                     [NSArray arrayWithObjects:
                      [NSNumber numberWithInt:temp[2]],
                      [NSNumber numberWithInt:temp[3]],
                      nil],
                     [NSArray arrayWithObjects:
                      [NSNumber numberWithInt:temp[4]],
                      [NSNumber numberWithInt:temp[5]],
                      nil],
                     [NSArray arrayWithObjects:
                      [NSNumber numberWithInt:temp[6]],
                      [NSNumber numberWithInt:temp[7]],
                      nil],
                     nil];

    [out retain];
    return out;
}

+ (TetrisCoord *) newFromValue:(int)seed {
    TetrisCoord *out = [[TetrisCoord alloc] init];
    out.intValue = seed;
    return out;
}

@end
