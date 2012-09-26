//
//  Transaction.m
//  MacOFX
//
//  Created by Richard McLaren on 26/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

- (NSString*)description {
    return [NSString stringWithFormat: @"%@ %10.2f %@", self.date, self.amount, self.name ];
}

@end
