//
//  dataHandler.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/30/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class DataHandler: NSObject {

    class func getQuizzes() -> quizzesTaken {
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        let libraryURL = libraryURLOptional
        var libraryPath = libraryURL!.path?.stringByAppendingPathComponent("qTaken")
        let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)
        if !fileExists {
            let freshData = quizzesTaken()
            DataHandler.processData(freshData)
            
        }
        let qTaken = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! quizzesTaken
        return qTaken
        
        
    }
    
    class func processData(data:quizzesTaken) {
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("qTaken")
            NSKeyedArchiver.archiveRootObject(data, toFile: libraryPath!)
            
        }
    }
}
