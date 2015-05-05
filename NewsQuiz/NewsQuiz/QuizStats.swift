//
//  quizStats.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 5/5/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizStats: NSObject, NSCoding {
    var overallCorrect = 0.0
    var overallTime = 0.0
    var worldCorrect = 0.0
    var worldTime = 0.0
    var usCorrect = 0.0
    var usTime = 0.0
    var politicsCorrect = 0.0
    var politicsTime = 0.0
    var businessCorrect = 0.0
    var businessTime = 0.0
    var technologyCorrect = 0.0
    var technologyTime = 0.0
    var sportsCorrect = 0.0
    var sportsTime = 0.0
    
    
    
    
    // MARK: NSCoding
    
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.overallCorrect = decoder.decodeDoubleForKey("overallCorrect")
        self.overallTime = decoder.decodeDoubleForKey("overallTime")
        
        self.worldCorrect = decoder.decodeDoubleForKey("worldCorrect")
        self.worldTime = decoder.decodeDoubleForKey("worldTime")
        
        self.usCorrect = decoder.decodeDoubleForKey("usCorrect")
        self.usTime = decoder.decodeDoubleForKey("usTime")
        
        self.politicsCorrect = decoder.decodeDoubleForKey("politicsCorrect")
        self.politicsTime = decoder.decodeDoubleForKey("politicsTime")
        
        self.businessCorrect = decoder.decodeDoubleForKey("businessCorrect")
        self.businessTime = decoder.decodeDoubleForKey("businessTime")
        
        self.technologyCorrect = decoder.decodeDoubleForKey("technologyCorrect")
        self.technologyTime = decoder.decodeDoubleForKey("technologyTime")
        
        self.sportsCorrect = decoder.decodeDoubleForKey("sportsCorrect")
        self.sportsTime = decoder.decodeDoubleForKey("sportsTime")

        
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeDouble(self.overallCorrect, forKey: "overallCorrect")
        coder.encodeDouble(self.overallTime, forKey: "overallTime")
        
        coder.encodeDouble(self.worldCorrect, forKey: "worldCorrect")
        coder.encodeDouble(self.worldTime, forKey: "worldTime")
        
        coder.encodeDouble(self.usCorrect, forKey: "usCorrect")
        coder.encodeDouble(self.usTime, forKey: "usTime")
        
        coder.encodeDouble(self.politicsCorrect, forKey: "politicsCorrect")
        coder.encodeDouble(self.politicsTime, forKey: "politicsTime")
        
        coder.encodeDouble(self.businessCorrect, forKey: "businessCorrect")
        coder.encodeDouble(self.businessTime, forKey: "businessTime")
        
        coder.encodeDouble(self.technologyCorrect, forKey: "technologyCorrect")
        coder.encodeDouble(self.technologyTime, forKey: "technologyTime")
        
        coder.encodeDouble(self.sportsCorrect, forKey: "sportsCorrect")
        coder.encodeDouble(self.sportsTime, forKey: "sportsTime")
        
        
    }
}
