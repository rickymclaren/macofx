//
//  OFXLoader.m
//  MacOFX
//
//  Created by Richard McLaren on 13/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import "OFXLoader.h"

@implementation OFXLoader

- (NSString*) loadXML {
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:NSDownloadsDirectory
                                             inDomains:NSUserDomainMask];
    NSURL* downloadDir = nil;
    
    if ([possibleURLs count] >= 1) {
        // Use the first directory (if multiple are returned)
        downloadDir = [possibleURLs objectAtIndex:0];
    }
    NSLog(@"%@", downloadDir);
    
    NSError *error = nil;
    NSArray *files = [sharedFM contentsOfDirectoryAtURL:downloadDir
                             includingPropertiesForKeys:nil
                                                options:NSDirectoryEnumerationSkipsHiddenFiles
                                                  error:&error];
    
    
    NSString *ofxFile = nil;
    for (NSURL *url in files) {
        NSString *filePath = [url relativePath];
        if ([filePath hasSuffix:@".ofx"]) {
            NSLog(@"%@", filePath );
            ofxFile = filePath;
        }
        
    }
    
    error = nil;
    NSString *contents = [NSString stringWithContentsOfFile:ofxFile encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"%@", error );
        
    } else {
        NSRange range = [contents rangeOfString:@"<OFX>"];
        contents = [contents substringFromIndex:range.location];
    }
    
    
    return contents;
    
}

@end
