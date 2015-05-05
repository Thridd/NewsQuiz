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
