//
//  PersonalStatsViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class PersonalStatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let sections = ["Overall Stats", "World Stats", "U.S. Stats", "Politics Stats", "Business Stats", "Technology Stats", "Sports Stats"]
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var backToQuizBtn: UIBarButtonItem!
    
    @IBOutlet weak var navBar: UINavigationItem!
    var quizStats = StatsDataHandler.getStats()

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.backgroundColor = UIColor(netHex:0x666666)
        navigationController?.navigationBar.barTintColor = UIColor(netHex:0x8DCCC0)
        navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func backToCatOrQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func backToQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let statsCell = collectionView.dequeueReusableCellWithReuseIdentifier("StatsCell", forIndexPath: indexPath) as! StatsCollectionViewCell
        if indexPath.section == 0 {
            var score = "\(quizStats.overallCorrect)" + "/" + "\(quizStats.overallWrong)"
            var time = "\(quizStats.overallTime)"
            
            

            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
             statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        
        if indexPath.section == 1 {
            var time = "\(quizStats.worldTime)"
            var score = "\(quizStats.worldCorrect)" + "/" + "\(quizStats.worldWrong)"
            
            println(quizStats.worldWrong)
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        
        if indexPath.section == 2 {
            var score = "\(quizStats.usCorrect)" + "/" + "\(quizStats.usWrong)"
            var time = "\(quizStats.usTime)"
            
            
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        if indexPath.section == 3 {
            var score = "\(quizStats.politicsCorrect)" + "/" + "\(quizStats.politicsWrong)"
            var time = "\(quizStats.politicsTime)"
            
            
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        if indexPath.section == 4 {
            var score = "\(quizStats.businessCorrect)" + "/" + "\(quizStats.businessWrong)"
            var time = "\(quizStats.businessTime)"
            
            
            
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        if indexPath.section == 5 {
            var score = "\(quizStats.technologyCorrect)" + "/" + "\(quizStats.technologyWrong)"
            var time = "\(quizStats.technologyTime)"

            
            
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        if indexPath.section == 6 {
            var score = "\(quizStats.sportsCorrect)" + "/" + "\(quizStats.sportsWrong)"
            var time = "\(quizStats.sportsTime)"

            
            
            
            let scoreCons = "Correct Answers"
            let timeCons = "Average Response Time"
            let header = sections[indexPath.section]
            statsCell.setStats(time, timeLabelText: score, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        }
        
       
        
        return statsCell
        
        
    }
}
