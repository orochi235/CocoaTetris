//
//  TetrisCell.m
//  CocoaTetris
//
//  Created by Michael Baker on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TetrisCell.h"


@implementation TetrisCell

@synthesize color;

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc {
    [color dealloc];
    [super dealloc];
}

+ (TetrisCell *) newCellWithColor:(NSColor *)c {
    
    TetrisCell *cell;
    cell = [[TetrisCell alloc] init];
    cell.color = c;
    return cell;
}

@end
