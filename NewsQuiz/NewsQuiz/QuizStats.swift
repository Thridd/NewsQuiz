//
//  quizStats.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 5/5/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizStats: NSObject, NSCoding {
    var overallCorrect: Int = 0
    var overallIncorrect: Int = 0
    var overallTime = 0.0
    var worldCorrect: Int = 0
    var worldIncorrect: Int = 0
    var worldTime = 0.0
    var usCorrect: Int = 0
    var usIncorrect: Int = 0
    var usTime = 0.0
    var politicsCorrect: Int = 0
    var politicsIncorrect: Int = 0
    var politicsTime = 0.0
    var businessCorrect: Int = 0
    var businessIncorrect: Int = 0
    var businessTime = 0.0
    var technologyCorrect: Int = 0
    var technologyIncorrect: Int = 0
    var technologyTime = 0.0
    var sportsCorrect: Int = 0
    var sportsIncorrect: Int = 0
    var sportsTime = 0.0
    
    
    
    
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        
        self.overallCorrect = decoder.decodeIntegerForKey("overallCorrect")
        self.overallIncorrect = decoder.decodeIntegerForKey("overallIncorrect")
        self.overallTime = decoder.decodeDoubleForKey("overallTime")
        
        self.worldCorrect = decoder.decodeIntegerForKey("worldCorrect")
        self.worldIncorrect = decoder.decodeIntegerForKey("worldIncorrect")
        self.worldTime = decoder.decodeDoubleForKey("worldTime")
        
        self.usCorrect = decoder.decodeIntegerForKey("usCorrect")
        self.usIncorrect = decoder.decodeIntegerForKey("usIncorrect")
        self.usTime = decoder.decodeDoubleForKey("usTime")
        
        self.politicsCorrect = decoder.decodeIntegerForKey("politicsCorrect")
        self.politicsIncorrect = decoder.decodeIntegerForKey("politicsIncorrect")
        self.politicsTime = decoder.decodeDoubleForKey("politicsTime")
        
        self.businessCorrect = decoder.decodeIntegerForKey("businessCorrect")
        self.businessIncorrect = decoder.decodeIntegerForKey("businessIncorrect")
        self.businessTime = decoder.decodeDoubleForKey("businessTime")
        
        self.technologyCorrect = decoder.decodeIntegerForKey("technologyCorrect")
        self.technologyIncorrect = decoder.decodeIntegerForKey("technologyIncorrect")
        self.technologyTime = decoder.decodeDoubleForKey("technologyTime")
        
        self.sportsCorrect = decoder.decodeIntegerForKey("sportsCorrect")
        self.sportsIncorrect = decoder.decodeIntegerForKey("sportsIncorrect")
        self.sportsTime = decoder.decodeDoubleForKey("sportsTime")

        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeInteger(self.overallCorrect, forKey: "overallCorrect")
        coder.encodeInteger(self.overallIncorrect, forKey: "overallIncorrect")
        coder.encodeDouble(self.overallTime, forKey: "overallTime")
        
        coder.encodeInteger(self.worldCorrect, forKey: "worldCorrect")
        coder.encodeInteger(self.worldIncorrect, forKey: "worldIncorrect")
        coder.encodeDouble(self.worldTime, forKey: "worldTime")
        
        coder.encodeInteger(self.usCorrect, forKey: "usCorrect")
        coder.encodeInteger(self.usIncorrect, forKey: "usIncorrect")
        coder.encodeDouble(self.usTime, forKey: "usTime")
        
        coder.encodeInteger(self.politicsCorrect, forKey: "politicsCorrect")
        coder.encodeInteger(self.politicsIncorrect, forKey: "politicsIncorrect")
        coder.encodeDouble(self.politicsTime, forKey: "politicsTime")
        
        coder.encodeInteger(self.businessCorrect, forKey: "businessCorrect")
        coder.encodeInteger(self.businessIncorrect, forKey: "businessIncorrect")
        coder.encodeDouble(self.businessTime, forKey: "businessTime")
        
        coder.encodeInteger(self.technologyCorrect, forKey: "technologyCorrect")
        coder.encodeInteger(self.technologyIncorrect, forKey: "technologyIncorrect")
        coder.encodeDouble(self.technologyTime, forKey: "technologyTime")
        
        coder.encodeInteger(self.sportsCorrect, forKey: "sportsCorrect")
        coder.encodeInteger(self.sportsIncorrect, forKey: "sportsIncorrect")
        coder.encodeDouble(self.sportsTime, forKey: "sportsTime")
        
        
    }
}
