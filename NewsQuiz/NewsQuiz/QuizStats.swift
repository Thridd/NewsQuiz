import UIKit

class QuizStats: NSObject, NSCoding {
    var overallCorrect = 0
    var overallTime = 0.0
    var worldCorrect = 0
    var worldTime = 0.0
    var usCorrect = 0
    var usTime = 0.0
    var politicsCorrect = 0
    var politicsTime = 0.0
    var businessCorrect = 0
    var businessTime = 0.0
    var technologyCorrect = 0
    var technologyTime = 0.0
    var sportsCorrect = 0
    var sportsTime = 0.0
    
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.overallCorrect = decoder.decodeIntegerForKey("overallCorrect")
        self.overallTime = decoder.decodeDoubleForKey("overallTime")
        
        self.worldCorrect = decoder.decodeIntegerForKey("worldCorrect")
        self.worldTime = decoder.decodeDoubleForKey("worldTime")
        
        self.usCorrect = decoder.decodeIntegerForKey("usCorrect")
        self.usTime = decoder.decodeDoubleForKey("usTime")
        
        self.politicsCorrect = decoder.decodeIntegerForKey("politicsCorrect")
        self.politicsTime = decoder.decodeDoubleForKey("politicsTime")
        
        self.businessCorrect = decoder.decodeIntegerForKey("businessCorrect")
        self.businessTime = decoder.decodeDoubleForKey("businessTime")
        
        self.technologyCorrect = decoder.decodeIntegerForKey("technologyCorrect")
        self.technologyTime = decoder.decodeDoubleForKey("technologyTime")
        
        self.sportsCorrect = decoder.decodeIntegerForKey("sportsCorrect")
        self.sportsTime = decoder.decodeDoubleForKey("sportsTime")
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeInteger(self.overallCorrect, forKey: "overallCorrect")
        coder.encodeDouble(self.overallTime, forKey: "overallTime")
        
        coder.encodeInteger(self.worldCorrect, forKey: "worldCorrect")
        coder.encodeDouble(self.worldTime, forKey: "worldTime")
        
        coder.encodeInteger(self.usCorrect, forKey: "usCorrect")
        coder.encodeDouble(self.usTime, forKey: "usTime")
        
        coder.encodeInteger(self.politicsCorrect, forKey: "politicsCorrect")
        coder.encodeDouble(self.politicsTime, forKey: "politicsTime")
        
        coder.encodeInteger(self.businessCorrect, forKey: "businessCorrect")
        coder.encodeDouble(self.businessTime, forKey: "businessTime")
        
        coder.encodeInteger(self.technologyCorrect, forKey: "technologyCorrect")
        coder.encodeDouble(self.technologyTime, forKey: "technologyTime")
        
        coder.encodeInteger(self.sportsCorrect, forKey: "sportsCorrect")
        coder.encodeDouble(self.sportsTime, forKey: "sportsTime")
    }
}
