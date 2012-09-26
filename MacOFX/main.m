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
#import "Transaction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NSString *xml = [[[OFXLoader alloc] init] loadXML];
        NSArray *transactions = [[[OFXParserDOM alloc] init] parsefromXMLString:xml];
        BOOL all = true;
        NSString *filter = @"";
        if (argc == 2) {
            all = false;
            filter = [NSString stringWithCString:argv[1] encoding: NSASCIIStringEncoding];
            
        }
        
        double total = 0.0;
        for (Transaction* t in transactions) {
            if (all || [t.name hasPrefix:filter]) {
                printf("%s\n", [t.description UTF8String]);
                total += t.amount;
                
            }
            
        }
        printf("Total %10.2f\n", total);
        
    }
    return 0;
}

