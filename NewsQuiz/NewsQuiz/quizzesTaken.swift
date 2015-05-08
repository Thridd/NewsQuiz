import UIKit

class quizzesTaken: NSObject, NSCoding {
    var takenWorld = false
    var takenUS = false
    var takenPolitics = false
    var takenBusiness = false
    var takenTechnology = false
    var takenSports = false
    
    
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.takenWorld = decoder.decodeBoolForKey("world")
        
        self.takenUS = decoder.decodeBoolForKey("us")
        
        self.takenPolitics = decoder.decodeBoolForKey("politics")
        
        self.takenBusiness = decoder.decodeBoolForKey("business")
        
        self.takenTechnology = decoder.decodeBoolForKey("world")
        
        self.takenSports = decoder.decodeBoolForKey("sports")
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeBool(self.takenWorld, forKey: "world")
        coder.encodeBool(self.takenUS, forKey: "us")
        coder.encodeBool(self.takenPolitics, forKey: "politics")
        coder.encodeBool(self.takenBusiness, forKey: "business")
        coder.encodeBool(self.takenTechnology, forKey: "technology")
        coder.encodeBool(self.takenSports, forKey: "sports")
        
    }
}
