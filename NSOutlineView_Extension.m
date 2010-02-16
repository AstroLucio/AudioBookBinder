//
//  NSOutlineView_Extension.m
//  AudioBookBinder
//
//  Created by Oleksandr Tymoshenko on 10-02-14.
//  Copyright 2010 Bluezbox Software. All rights reserved.
//

#import "NSOutlineView_Extension.h"

@implementation NSOutlineView(MyExtensions)

- (NSArray *) selectedItems {
    NSMutableArray *items = [NSMutableArray array];
    NSIndexSet *selectedRows = [self selectedRowIndexes];
    if (selectedRows != nil) {
        for (NSInteger row = [selectedRows firstIndex]; 
			 row != NSNotFound; row = [selectedRows indexGreaterThanIndex:row]) {
            [items addObject:[self itemAtRow:row]];
        }
    }
    return items;
}

- (void)setSelectedItems:(NSArray *)items {
    // If we are extending the selection, we start with the existing selection; 
	// otherwise, we create a new blank set of the indexes.
    NSMutableIndexSet *newSelection = [[NSMutableIndexSet alloc] init];
    
    for (NSInteger i = 0; i < [items count]; i++) {
        NSInteger row = [self rowForItem:[items objectAtIndex:i]];
        if (row >= 0) {
            [newSelection addIndex:row];
        }
    }
    
    [self selectRowIndexes:newSelection byExtendingSelection:NO];
    
    [newSelection release];
}

@end