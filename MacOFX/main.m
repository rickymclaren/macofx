//
//  main.m
//  MacOFX
//
//  Created by Richard McLaren on 11/09/2012.
//  Copyright (c) 2012 Richard McLaren. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *home = NSHomeDirectory();
        NSLog(@"%@", home);
        
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
        NSArray *properties = [NSArray arrayWithObjects:NSURLLocalizedNameKey, NSURLAttributeModificationDateKey, nil];
        NSArray *files = [sharedFM contentsOfDirectoryAtURL:downloadDir
                                includingPropertiesForKeys:properties
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
        if (ofxFile) {
            NSString *contents = [NSString stringWithContentsOfFile:ofxFile encoding:NSUTF8StringEncoding error:&error];
            if (error) {
                NSLog(@"%@", error );
                
            } else {
                NSRange range = [contents rangeOfString:@"<OFX>"];
                contents = [contents substringFromIndex:range.location];

                NSXMLDocument *doc = [[NSXMLDocument alloc] initWithXMLString:contents options:0 error:&error];
                
                if (error) {
                    NSLog(@"%@", error );
                } else {
                    NSLog(@"%@", doc );
                }
            }
        }
        
    }
    return 0;
}

