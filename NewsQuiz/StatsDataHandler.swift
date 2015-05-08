import Foundation


import UIKit

class StatsDataHandler: NSObject {
    
    class func getStats() -> QuizStats {
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        let libraryURL = libraryURLOptional
        var libraryPath = libraryURL!.path?.stringByAppendingPathComponent("qStats")
        let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)
        if !fileExists {
            let freshData = QuizStats()
            StatsDataHandler.processData(freshData)
            
        }
        let qTaken = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! QuizStats
        return qTaken
        
        
    }
    
    class func processData(data:QuizStats) {
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("qStats")
            NSKeyedArchiver.archiveRootObject(data, toFile: libraryPath!)
            
        }
    }
}
