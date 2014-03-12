//
//  CocoaTetrisAppDelegate.h
//  CocoaTetris
//
//  Created by Michael Baker on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TetrisViewController;

@interface CocoaTetrisAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    TetrisViewController *controller;
}

@property (assign) IBOutlet NSWindow *window;
@property (retain) IBOutlet TetrisViewController *controller;

@end
