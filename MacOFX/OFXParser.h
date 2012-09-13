//
//  OFXParser.h
//  MacOFX
//
//  Created by Richard McLaren on 13/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OFXParser <NSObject>
- (NSArray*) parsefromXMLString: (NSString *) xml;
@end
