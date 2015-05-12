//
//  QuizViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

struct Results {
    var question1Result = 0
    var question2Result = 0
    var question3Result = 0
    var time1 = 0
    var time2 = 0
    var time3 = 0
}

class QuizViewController: UIViewController {
    
    @IBOutlet weak var navBarTitle: UINavigationBar!
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var timerDisplay: UILabel!
    
    @IBOutlet weak var quizQuestionText: UITextView!
    
    @IBOutlet weak var toStatsBtn: UIButton!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()
    var question = 1;
    var category = String()
    let numQuestions = 3
    var answerIndex: Int = 0
    
    var quizData:[Article] = [Article]()
    var answerData: [String] = [String]()
    var Result = Results()
    var saveData = QuizStats()
    var responseTime = [0, 0, 0]
    var averageResponseTime = 0.0
    var numCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initial color setup
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.barTintColor = UIColor(netHex:0x8DCCC0)
        self.view.backgroundColor = UIColor(netHex:0x666666)
        quizQuestionText.backgroundColor = UIColor(netHex:0x666666)
        answerA.backgroundColor = UIColor(netHex:0x8DCCC0)
        answerB.backgroundColor = UIColor(netHex:0x8DCCC0)
        answerC.backgroundColor = UIColor(netHex:0x8DCCC0)
        answerD.backgroundColor = UIColor(netHex:0x8DCCC0)
        //Access quiz data
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let data = appDelegate.getArticleData()
        //Find corresponding answers
        for article in data.articleData {
            if (article.articleCat == category) {
                quizData.append(article)
                answerData.append(article.correctAns)
                answerData.append(article.wrongAns1)
                answerData.append(article.wrongAns2)
                answerData.append(article.wrongAns3)
            }
        }
        //Randomize order of questions
        setRandomAnswer(answerA, mod: 4)
        setRandomAnswer(answerB, mod: 3)
        setRandomAnswer(answerC, mod: 2)
        setRandomAnswer(answerD, mod: 1)
        
        //Set question number
        questionNumber.text = "Question \(question)/3"
        toStatsBtn.hidden = true
        
        quizQuestionText.text = quizData[question-1].question
        //navBarTitle.topItem?.title = quizData[question-1].articleCat
        
        //Starts the timer when the page loads
        if (timerRunning == false) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
        }
        if (question == 3) {
            averageResponseTime = Double(responseTime[0] + responseTime[1] + responseTime[2]) / Double(question)
            nextQuestion.hidden = true
            toStatsBtn.hidden = false
            if (category == "World") {
                saveData.worldTime = averageResponseTime
                saveData.worldCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            } else if (category == "U.S.") {
                saveData.usTime = averageResponseTime
                saveData.usCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            } else if (category == "Politics") {
                saveData.politicsTime = averageResponseTime
                saveData.politicsCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            } else if (category == "Business") {
                saveData.businessTime = averageResponseTime
                saveData.businessCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            } else if (category == "Technology") {
                saveData.technologyTime = averageResponseTime
                saveData.technologyCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            } else {
                saveData.sportsTime = averageResponseTime
                saveData.sportsCorrect = numCorrect
                StatsDataHandler.processData(saveData)
            }
        }
        
    }

    func setRandomAnswer(button: UIButton, mod: Int) {
        answerIndex = Int(arc4random() % UInt32(mod)) + (question - 1) * 4
        var answer = answerData[answerIndex]
        button.setTitle(answer, forState: UIControlState.Normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        answerData.removeAtIndex(answerIndex)
        button.titleLabel?.numberOfLines = 2
    }
    
    func showCorrectAnswer(button1: UIButton, button2: UIButton, button3: UIButton) {
        if (button1.titleLabel?.text == quizData[question-1].correctAns) {
            button1.backgroundColor = UIColor(netHex:0xD3E397)
        } else if (button2.titleLabel?.text == quizData[question-1].correctAns) {
            button2.backgroundColor = UIColor(netHex:0xD3E397)
        } else {
            button3.backgroundColor = UIColor(netHex:0xD3E397)
        }
    }
    
    @IBAction func nextQuestion(sender: UIButton) {
        timerCount = 0
        timerDisplay.text = "0"
        question++
        //self.view.setNeedsDisplay()
        answerData.removeAll()
        self.viewDidLoad()
    }
    
    @IBAction func answerA(sender: UIButton) {
        stopTimer()
        responseTime[question-1] = timerCount
        if (answerA.titleLabel?.text == quizData[question-1].correctAns) {
            numCorrect++
            answerA.backgroundColor = UIColor(netHex:0xD3E397)
        } else {
            answerA.backgroundColor = UIColor(netHex:0xE96C44)
            showCorrectAnswer(answerB, button2: answerC, button3: answerD)
        }
    }
    
    @IBAction func answerB(sender: UIButton) {
        stopTimer()
        responseTime[question-1] = timerCount
        if (answerB.titleLabel?.text == quizData[question-1].correctAns) {
            answerB.backgroundColor = UIColor(netHex:0xD3E397)
            numCorrect++
        } else {
            answerB.backgroundColor = UIColor(netHex:0xE96C44)
            showCorrectAnswer(answerA, button2: answerC, button3: answerD)
        }
    }
    
    @IBAction func answerC(sender: UIButton) {
        stopTimer()
        responseTime[question-1] = timerCount
        if (answerC.titleLabel?.text == quizData[question-1].correctAns) {
            answerC.backgroundColor = UIColor(netHex:0xD3E397)
            numCorrect++
        } else {
            answerC.backgroundColor = UIColor(netHex:0xE96C44)
            showCorrectAnswer(answerB, button2: answerA, button3: answerD)
        }
    }
    
    @IBAction func answerD(sender: UIButton) {
        stopTimer()
        responseTime[question-1] = timerCount
        if (answerD.titleLabel?.text == quizData[question-1].correctAns) {
            answerD.backgroundColor = UIColor(netHex:0xD3E397)
            numCorrect++
        } else {
            answerD.backgroundColor = UIColor(netHex:0xE96C44)
            showCorrectAnswer(answerB, button2: answerC, button3: answerA)
        }
    }
    
    func stopTimer() {
        if (timerRunning == true) {
            timer.invalidate()
            timerRunning = false
        }
    }
    
    func counting() {
        timerCount += 1
        if (timerCount < 10) {
            timerDisplay.text = "00:0\(timerCount)"
        } else if (timerCount < 60){
            timerDisplay.text = "00:\(timerCount)"
        } else {
            var mins = timerCount / 60
            var seconds = timerCount - (mins * 60)
            if (mins < 10) {
                if (seconds < 10) {
                    timerDisplay.text = "0\(mins):0\(seconds)"
                } else {
                    timerDisplay.text = "0\(mins):\(seconds)"
                }
            } else {
                if (seconds < 10) {
                    timerDisplay.text = "\(mins):0\(seconds)"
                } else {
                    timerDisplay.text = "\(mins):\(seconds)"
                }
            }
        }
    }
    
    @IBAction func quit(sender: AnyObject) {
        //Will need to make sure quiz is marked as completed before below
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func toStats(sender: AnyObject) {
        performSegueWithIdentifier("toResults", sender: self)

    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
