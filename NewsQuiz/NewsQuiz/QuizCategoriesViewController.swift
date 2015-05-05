//
//  QuizCategoriesViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class QuizCategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var quizNavBar: UINavigationBar!
    
    @IBOutlet weak var catTableView: UITableView!
    
    
    var categories:[String] = [String]()

    var a = quizzesTaken()
    var selectedBtn = Int()
    var selectedCategory = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let articleData = appDelegate.getArticleData()
        //println(articleData.articleData[0].date )
        
        for var i = 0; i < articleData.articleData.count; i+=3 {
            categories.append(articleData.articleData[i].articleCat)
        }
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toArticles(sender: AnyObject) {
        performSegueWithIdentifier("toArticles", sender: self)
        
    }
    
    @IBAction func toStats(sender: AnyObject) {
        selectedBtn = 1
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

        
        /*if DataHandler.getQuizzes().takenWorld == true && DataHandler.getQuizzes().takenUS == true && DataHandler.getQuizzes().takenPolitics == true && DataHandler.getQuizzes().takenBusiness == true && DataHandler.getQuizzes().takenTechnology == true && DataHandler.getQuizzes().takenSports == true{
            
        }*/
        

        if categories[indexPath.row] == "World"{
            if DataHandler.getQuizzes().takenWorld == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        else if categories[indexPath.row] == "U.S."{
            if DataHandler.getQuizzes().takenUS == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        else if categories[indexPath.row] == "Politics"{
            if DataHandler.getQuizzes().takenPolitics == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        else if categories[indexPath.row] == "Business"{
            if DataHandler.getQuizzes().takenBusiness == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        else if categories[indexPath.row] == "Technology"{
            if DataHandler.getQuizzes().takenTechnology == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        else if categories[indexPath.row] == "Sports"{
            if DataHandler.getQuizzes().takenSports == true{
                cell.userInteractionEnabled = false
                cell.backgroundColor = UIColor.redColor()
            }
        }
        
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCategory = categories[indexPath.row]
        selectedBtn == 2
        if categories[indexPath.row] == "World"{
            a.takenWorld = true
            DataHandler.processData(a)
        }
        if categories[indexPath.row] == "U.S."{
            a.takenUS = true
            DataHandler.processData(a)
        }
        if categories[indexPath.row] == "Politics"{
            a.takenPolitics = true
            DataHandler.processData(a)
        }
        if categories[indexPath.row] == "Business"{
            a.takenBusiness = true
            DataHandler.processData(a)
        }
        if categories[indexPath.row] == "Technology"{
            a.takenTechnology = true
            DataHandler.processData(a)
        }
        if categories[indexPath.row] == "Sports"{
            a.takenSports = true
            DataHandler.processData(a)
        }
       
        
       
        
        self.catTableView.reloadData()
        
        performSegueWithIdentifier("toQuiz", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if selectedBtn == 1{
            let destinationViewController = segue.destinationViewController as! PersonalStatsViewController
            destinationViewController.fromPage = 1
        }
        else if selectedBtn == 2{
            let destinationViewController = segue.destinationViewController as! QuizViewController
            //destinationViewController.quizCategory = selectedCategory
        }
        
        
    }
    
    @IBAction func returnToQuizzes(segue: UIStoryboardSegue) {
        
    }

}
