//
//  quizStats.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 5/5/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizStats: NSObject, NSCoding {
    var overallCorrect = 0
    var overallWrong = 0
    var overallTime = 0.0
    
    var worldCorrect = 0
    var worldWrong = 0
    var worldTime = 0.0
    
    var usCorrect = 0
    var usWrong = 0
    var usTime = 0.0
    
    var politicsCorrect = 0
    var politicsWrong = 0
    var politicsTime = 0.0
    
    var businessCorrect = 0
    var businessWrong = 0
    var businessTime = 0.0
    
    var technologyCorrect = 0
    var technologyWrong = 0
    var technologyTime = 0.0
    
    var sportsCorrect = 0
    var sportsWrong = 0
    var sportsTime = 0.0
    
    
    
    
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.overallCorrect = decoder.decodeIntegerForKey("overallCorrect")
        self.overallWrong = decoder.decodeIntegerForKey("overallWrong")
        self.overallTime = decoder.decodeDoubleForKey("overallTime")
        
        self.worldCorrect = decoder.decodeIntegerForKey("worldCorrect")
        self.worldWrong = decoder.decodeIntegerForKey("worldWrong")
        self.worldTime = decoder.decodeDoubleForKey("worldTime")
        
        self.usCorrect = decoder.decodeIntegerForKey("usCorrect")
        self.usWrong = decoder.decodeIntegerForKey("usWrong")
        self.usTime = decoder.decodeDoubleForKey("usTime")
        
        self.politicsCorrect = decoder.decodeIntegerForKey("politicsCorrect")
        self.politicsWrong = decoder.decodeIntegerForKey("politicsWrong")
        self.politicsTime = decoder.decodeDoubleForKey("politicsTime")
        
        self.businessCorrect = decoder.decodeIntegerForKey("businessCorrect")
        self.businessWrong = decoder.decodeIntegerForKey("businessWrong")
        self.businessTime = decoder.decodeDoubleForKey("businessTime")
        
        self.technologyCorrect = decoder.decodeIntegerForKey("technologyCorrect")
        self.technologyWrong = decoder.decodeIntegerForKey("technologyWrong")
        self.technologyTime = decoder.decodeDoubleForKey("technologyTime")
        
        self.sportsCorrect = decoder.decodeIntegerForKey("sportsCorrect")
        self.sportsWrong = decoder.decodeIntegerForKey("sportsWrong")
        self.sportsTime = decoder.decodeDoubleForKey("sportsTime")
        
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeInteger(self.overallCorrect, forKey: "overallCorrect")
        coder.encodeInteger(self.overallWrong, forKey: "overallWrong")
        coder.encodeDouble(self.overallTime, forKey: "overallTime")
        
        coder.encodeInteger(self.worldCorrect, forKey: "worldCorrect")
        coder.encodeInteger(self.worldWrong, forKey: "worldWrong")
        coder.encodeDouble(self.worldTime, forKey: "worldTime")
        
        coder.encodeInteger(self.usCorrect, forKey: "usCorrect")
        coder.encodeInteger(self.usWrong, forKey: "usWrong")
        coder.encodeDouble(self.usTime, forKey: "usTime")
        
        coder.encodeInteger(self.politicsCorrect, forKey: "politicsCorrect")
        coder.encodeInteger(self.politicsWrong, forKey: "politicsWrong")
        coder.encodeDouble(self.politicsTime, forKey: "politicsTime")
        
        coder.encodeInteger(self.businessCorrect, forKey: "businessCorrect")
        coder.encodeInteger(self.businessWrong, forKey: "businessWrong")
        coder.encodeDouble(self.businessTime, forKey: "businessTime")
        
        coder.encodeInteger(self.technologyCorrect, forKey: "technologyCorrect")
        coder.encodeInteger(self.technologyWrong, forKey: "technologyWrong")
        coder.encodeDouble(self.technologyTime, forKey: "technologyTime")
        
        coder.encodeInteger(self.sportsCorrect, forKey: "sportsCorrect")
        coder.encodeInteger(self.sportsWrong, forKey: "sportsWrong")
        coder.encodeDouble(self.sportsTime, forKey: "sportsTime")
        
        
    }
}
