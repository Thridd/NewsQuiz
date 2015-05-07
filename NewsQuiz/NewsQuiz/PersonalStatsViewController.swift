//
//  PersonalStatsViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class PersonalStatsViewController: UIViewController {

    
    @IBOutlet weak var backToQuizBtn: UIBarButtonItem!
    
    @IBOutlet weak var quizzesBtn: UIBarButtonItem!
    
    @IBOutlet weak var overallCA: UILabel!
    
    @IBOutlet weak var overallTime: UILabel!
    
    @IBOutlet weak var worldCA: UILabel!
    
    @IBOutlet weak var worldTime: UILabel!
    
    @IBOutlet weak var usCA: UILabel!
    
    @IBOutlet weak var usTime: UILabel!
    
    @IBOutlet weak var politicsCA: UILabel!
    
    @IBOutlet weak var politicsTime: UILabel!
    
    @IBOutlet weak var businessCA: UILabel!
    
    @IBOutlet weak var businessTime: UILabel!
    
    @IBOutlet weak var techCA: UILabel!
    
    @IBOutlet weak var techTime: UILabel!
    
    @IBOutlet weak var sportsCA: UILabel!
    
    @IBOutlet weak var sportsTime: UILabel!
        
    var fromPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fromPage == 1{
          backToQuizBtn.title = "< Categories"
            quizzesBtn.title = ""
        }
        if fromPage == 2{
            backToQuizBtn.title = "< Quiz Results"
            quizzesBtn.title = ""
        }
        var quizStats = StatsDataHandler.getStats()
        
        
        overallCA?.text = "\(quizStats.overallCorrect)" + "/" + "\(quizStats.overallWrong)"
        var timeStr = "\(quizStats.overallTime)"
        var timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            overallTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            overallTime?.text = timeArr[0] + ":" + timeArr[1]
        }

       
        
        worldCA?.text = "\(quizStats.worldCorrect)" + "/" + "\(quizStats.worldWrong)"
        timeStr = "\(quizStats.worldTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            worldTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            worldTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        usCA?.text = "\(quizStats.usCorrect)" + "/" + "\(quizStats.usWrong)"
        timeStr = "\(quizStats.usTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            usTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            usTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        politicsCA?.text = "\(quizStats.politicsCorrect)" + "/" + "\(quizStats.politicsWrong)"
        timeStr = "\(quizStats.politicsTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            politicsTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            politicsTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        businessCA?.text = "\(quizStats.businessCorrect)" + "/" + "\(quizStats.businessWrong)"
        timeStr = "\(quizStats.businessTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            businessTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            businessTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        techCA?.text = "\(quizStats.technologyCorrect)" + "/" + "\(quizStats.technologyWrong)"
        timeStr = "\(quizStats.technologyTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            techTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            techTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        sportsCA?.text = "\(quizStats.sportsCorrect)" + "/" + "\(quizStats.sportsWrong)"
        timeStr = "\(quizStats.sportsTime)"
        timeArr = timeStr.componentsSeparatedByString(".")
        if count(timeArr[1]) == 1{
            sportsTime?.text = timeArr[0] + ":" + timeArr[1] + "0"
        }
        else{
            sportsTime?.text = timeArr[0] + ":" + timeArr[1]
        }
        
        
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToCatOrQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func backToQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
