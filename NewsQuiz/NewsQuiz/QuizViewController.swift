//
//  QuizViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var toStatsBtn: UIButton!
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    @IBOutlet weak var answerA: UIButton!
    
    @IBOutlet weak var answerB: UIButton!
    
    @IBOutlet weak var answerC: UIButton!
    
    @IBOutlet weak var answerD: UIButton!
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var nextQuestion: UIButton!
    
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()
    var question = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionNumber.text = "Question \(question)/3"
        answerA.backgroundColor = UIColor.blueColor()
        answerB.backgroundColor = UIColor.blueColor()
        answerC.backgroundColor = UIColor.blueColor()
        answerD.backgroundColor = UIColor.blueColor()
        toStatsBtn.hidden = true
        
        //Starts the timer when the page loads
        if (timerRunning == false) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
        }
        if (question == 3) {
            nextQuestion.hidden = true
            toStatsBtn.hidden = false
            
        }
        
    }

    @IBAction func nextQuestion(sender: UIButton) {
        timerCount = 0
        timerDisplay.text = "0"
        question++
        //self.view.setNeedsDisplay()
        self.viewDidLoad()
    
    }
    
    @IBAction func answerA(sender: UIButton) {
        stopTimer()
        //Check if answer is correct
        answerA.backgroundColor = UIColor.greenColor()
        
    }
    
    @IBAction func answerB(sender: UIButton) {
        
    }
    
    @IBAction func answerC(sender: UIButton) {
        
    }
    
    @IBAction func answerD(sender: UIButton) {
        
    }
    
    func stopTimer() {
        
        if (timerRunning == true) {
            timer.invalidate()
            timerRunning = false
        }
    }
    
    func counting() {
        timerCount += 1
        timerDisplay.text = "\(timerCount)"
    }
    
    @IBAction func quit(sender: AnyObject) {
        //Will need to make sure quiz is marked as completed before below
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func toStats(sender: AnyObject) {
        performSegueWithIdentifier("toResults", sender: self)

    }
}
