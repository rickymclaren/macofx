//
//  main.m
//  MacOFX
//
//  Created by Richard McLaren on 11/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OFXLoader.h"
#import "OFXParserDOM.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NSString *xml = [[[OFXLoader alloc] init] loadXML];
        NSArray* transactions = [[[OFXParserDOM alloc] init] parsefromXMLString:xml];
        NSLog(@"Transactions %@", transactions);
        
    }
    return 0;
}

