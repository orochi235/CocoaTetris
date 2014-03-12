//
//  GamePiece.h
//
//  Like TetrisPiece, but in three dimensions
//   I was wondering whether to make this more generic, but I think it makes more
//   sense to add attributes than to try to represent shit in 5 dimensions or
//   something :p
//


#import <Foundation/Foundation.h>

#import "GameCell.h"

@interface GamePiece : NSObject {
@private
        
}

- (id)init;

// TODO: smarter initializers   

// TODO: rotation methods
/*
- (void)invert;
- (void)rotateCCW;
- (void)rotateCW;
*/

- (void)setCellAtX:(int)x Y:(int)y Z:(int)z To:(GameCell *)contents;

@end
