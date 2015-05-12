//
//  StatsCollectionViewCell.swift
//  NewsQuiz
//
//  Created by University of Missouri on 5/7/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreConstantLabel: UILabel!
    @IBOutlet weak var timeConstantLabel: UILabel!
    
    func setStats(scoreLabelText: String, timeLabelText: String, scoreConstantLabelText: String, timeConstantLabelText: String, headerText: String) {
        scoreLabel.text = scoreLabelText
        scoreLabel.numberOfLines = 2
        timeLabel.text = timeLabelText
        timeLabel.numberOfLines = 2
        scoreConstantLabel.text = scoreConstantLabelText
        
        timeConstantLabel.text = timeConstantLabelText
        header.text = headerText
    }
    
}
