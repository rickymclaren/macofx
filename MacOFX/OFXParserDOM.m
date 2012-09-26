//
//  OFXParserDOM.m
//  MacOFX
//
//  Created by Richard McLaren on 13/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import "OFXParserDOM.h"
#import "Transaction.h"

@implementation OFXParserDOM
- (NSArray*) parsefromXMLString: (NSString *) xml {

    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    NSError* error;
    NSXMLDocument *doc = [[NSXMLDocument alloc] initWithXMLString:xml options:0 error:&error];
    
    if (error) {
        NSLog(@"%@", error );
    } else {
        NSArray* transNodes = [doc nodesForXPath:@"OFX/BANKMSGSRSV1/STMTTRNRS/STMTRS/BANKTRANLIST/STMTTRN" error:&error];
        
        for (NSXMLElement* node in transNodes) {
            Transaction* t = [[Transaction alloc] init];
            NSXMLElement *name = [[node elementsForName:@"NAME"] objectAtIndex:0];
            NSXMLElement *date = [[node elementsForName:@"DTPOSTED"] objectAtIndex:0];
            NSXMLElement *amount = [[node elementsForName:@"TRNAMT"] objectAtIndex:0];
            NSXMLElement *type = [[node elementsForName:@"TRNTYPE"] objectAtIndex:0];
            
            t.date = [date objectValue];
            t.amount = [[amount objectValue] floatValue];
            t.name = [name objectValue];
            t.type = [type objectValue];
            
            [result addObject:t];
        }
        
    }

    return result;
}


@end
