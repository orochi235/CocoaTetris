//
//  TetrisCoord.h
//  CocoaTetris
//
//  Created by Michael Baker on 5/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TetrisCoord : NSObject {
@private
    int bits;
}

- (id)init;
- (void)setIndex:(int)index ToX:(int)x Y:(int)y;
- (int)xOfIndex:(int)index;
- (int)yOfIndex:(int)index;

+ (NSArray *) newArrayFromCoords:(TetrisCoord *)c;
+ (TetrisCoord *) newFromValue:(int)seed;

@property int intValue;

@end