//
//  Transaction.h
//  MacOFX
//
//  Created by Richard McLaren on 26/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property NSString *date, *name, *memo, *type;
@property double amount;

@end
