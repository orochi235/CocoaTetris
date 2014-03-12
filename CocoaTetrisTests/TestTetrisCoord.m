//
//  TestTetrisCoord.m
//  CocoaTetris
//
//  Created by Michael Baker on 5/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestTetrisCoord.h"

@implementation TestTetrisCoord

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testCoordPacking {
    
    TetrisCoord *coord = [TetrisCoord newFromValue:0];
    [coord setIndex:0 ToX:0 Y:0];
    NSLog(@"Packed test coord     0: %x", coord.intValue);
    [coord setIndex:1 ToX:1 Y:1];
    NSLog(@"Packed test coords   10: %x", coord.intValue);
    [coord setIndex:2 ToX:2 Y:2];
    NSLog(@"Packed test coords  210: %x", coord.intValue);
    [coord setIndex:3 ToX:3 Y:3];
    NSLog(@"Packed test coords 3210: %x", coord.intValue);
    [coord release];
    //   STAssertEqualObjects([NSString stringWithFormat:@"%x"]);
    coord = [TetrisCoord newFromValue:0xfa50];

    
}

@end
