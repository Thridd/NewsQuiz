//
//  QuizResultsViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizResultsViewController: UIViewController {

    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    var category: String = String()
    var numCorrect:Int = Int()
    var time:Double = Double()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(netHex:0x8DCCC0)
        self.navigationItem.hidesBackButton = true
        self.title = category + " " + "Results"
        let timeReformat = NSString(format: "%.2f", time)
        answerLabel.text = "\(numCorrect)" + "/" + "\(3)"
        timeLabel.text = "\(timeReformat)"
        categoryLabel.text = category + " " + "Results"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toPersonalStats(sender: AnyObject) {
        performSegueWithIdentifier("toPersonalStats", sender: self)

    }

    @IBAction func toQuizCategories(sender: AnyObject) {
        performSegueWithIdentifier("toQuizCategories", sender: self)

        
    }
    
    @IBAction func toArticles(sender: AnyObject) {
        performSegueWithIdentifier("toArticleList", sender: self)

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
