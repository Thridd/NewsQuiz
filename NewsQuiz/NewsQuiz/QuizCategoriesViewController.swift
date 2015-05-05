//
//  QuizCategoriesViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizCategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var categories = ["World", "U.S.", "Politics", "Business", "Technology", "Sports"]
    
    
    
    var selectedCategory = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let articleData = appDelegate.getArticleData()
        //println(articleData.articleData[0].date )
        
        

        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toArticles(sender: AnyObject) {
        performSegueWithIdentifier("toArticles", sender: self)
        
    }
    
    @IBAction func toStats(sender: AnyObject) {
        performSegueWithIdentifier("toStats", sender: self)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("categoryCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = categories[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCategory = categories[indexPath.row]
        performSegueWithIdentifier("toQuiz", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //let destinationViewController = segue.destinationViewController as! QuizViewController
        //destinationViewController.region = selectedRegion
    }
    
    @IBAction func returnToQuizzes(segue: UIStoryboardSegue) {
        
    }

}
