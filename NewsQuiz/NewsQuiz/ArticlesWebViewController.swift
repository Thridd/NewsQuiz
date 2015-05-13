//
//  ArticlesWebViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class ArticlesWebViewController: UIViewController {

    var art: Article?
    var cameFrom:Int = Int()
    var selectedBtn = 1
    var category:String = String()
    @IBOutlet weak var articleViewer: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        var quizBtn : UIBarButtonItem = UIBarButtonItem(title: "Take Quiz", style: UIBarButtonItemStyle.Plain, target: self, action: "takeQuiz:")
        
        if category == "World" {
            if DataHandler.getQuizzes().takenWorld == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
        if category == "U.S." {
            if DataHandler.getQuizzes().takenUS == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
        if category == "Politics" {
            if DataHandler.getQuizzes().takenPolitics == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
        if category == "Sports" {
            if DataHandler.getQuizzes().takenSports == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
        if category == "Technology" {
            if DataHandler.getQuizzes().takenTechnology == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
        if category == "Business" {
            if DataHandler.getQuizzes().takenBusiness == false{
                self.navigationItem.rightBarButtonItem = quizBtn
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(art != nil) {
            if let url = art?.url{
                let fullURL = NSURL(string: url)
                let urlRequest = NSURLRequest(URL: fullURL!)
                if let check = art?.articleCat{
                    navigationItem.title = check
                    category = check
                }
                articleViewer.loadRequest(urlRequest)
            }
        }
    }
    
    func takeQuiz(sender: UIBarButtonItem) {
        selectedBtn = 2
        var a = DataHandler.getQuizzes()
        
        if category == "World" {
            a.takenWorld = true
            DataHandler.processData(a)
        }
        if category == "U.S." {
            a.takenUS = true
            DataHandler.processData(a)
        }
        if category == "Politics" {
            a.takenPolitics = true
            DataHandler.processData(a)
        }
        if category == "Sports" {
            a.takenSports = true
            DataHandler.processData(a)
        }
        if category == "Technology" {
            a.takenTechnology = true
            DataHandler.processData(a)
        }
        if category == "Business" {
            a.takenBusiness = true
            DataHandler.processData(a)
        }
        performSegueWithIdentifier("takeQuiz", sender: self)
    }
    
    @IBAction func backToQuizOrArticles(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func toQuiz(sender: AnyObject) {
        
        performSegueWithIdentifier("takeQuiz", sender: self)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if selectedBtn == 2{
            let destinationViewController = segue.destinationViewController as! QuizViewController
            destinationViewController.category = category
            destinationViewController.cameFrom = 1
        }
    }
}
