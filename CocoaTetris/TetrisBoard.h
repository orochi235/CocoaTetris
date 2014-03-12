//
//  TetrisBoard.h
//  CocoaTetris
//
//  Created by Michael Baker on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CocoaTetris.h"
#import "TetrisCell.h"

@interface TetrisBoard : NSObject {
@private
    int height;
    NSMutableArray *map;
    int width;
}

- (id)initWithWidth:(int)w Height:(int)h;
- (TetrisCell *)cellAtX:(int)x Y:(int)y;
- (void)setCellAtX:(int)x Y:(int)y To:(TetrisCell *)value;

+ (TetrisBoard *)newBoard;
+ (TetrisBoard *)newBoardOfWidth:(int)w Height:(int)h;

@property (readonly) int height;
@property (readonly) int width;

@end