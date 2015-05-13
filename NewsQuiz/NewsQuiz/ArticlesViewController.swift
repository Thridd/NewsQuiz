//
//  ArticlesViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var articlesTableView: UITableView!
    var art: Articles = Articles()
    var urls: [String] = [String]()
    var selectedArticle: Article?
    var categories:[String] = [String]()
    var counter = 0
    var world:[Article] = [Article]()
    var us:[Article] = [Article]()
    var politics:[Article] = [Article]()
    var business:[Article] = [Article]()
    var technology:[Article] = [Article]()
    var sports:[Article] = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let articleData = appDelegate.getArticleData()
        
        for var i = 0; i < articleData.articleData.count; i+=3 {
            categories.append(articleData.articleData[i].articleCat)
        }
        for var i = 0; i < articleData.articleData.count; i++ {
            if i < 3{
                world.append(articleData.articleData[i])
            }
            else if i < 6{
                us.append(articleData.articleData[i])
            }
            else if i < 9{
                politics.append(articleData.articleData[i])
            }
            else if i < 12{
                business.append(articleData.articleData[i])
                
            }
            else if i < 15{
                technology.append(articleData.articleData[i])
                
            }
            else if i < 18{
                sports.append(articleData.articleData[i])
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! UITableViewCell
        if indexPath.section == 0{
            cell.textLabel?.text = world[indexPath.row].headline
            cell.detailTextLabel?.text = "\(world[indexPath.row].date)"
        }
        if indexPath.section == 1{
            cell.textLabel?.text = us[indexPath.row].headline
            cell.detailTextLabel?.text = "\(us[indexPath.row].date)"
        }
        if indexPath.section == 2{
            cell.textLabel?.text = politics[indexPath.row].headline
            cell.detailTextLabel?.text = "\(politics[indexPath.row].date)"
        }
        if indexPath.section == 3{
            cell.textLabel?.text = business[indexPath.row].headline
            cell.detailTextLabel?.text = "\(business[indexPath.row].date)"
        }
        if indexPath.section == 4{
            cell.textLabel?.text = technology[indexPath.row].headline
            cell.detailTextLabel?.text = "\(technology[indexPath.row].date)"
        }
        if indexPath.section == 5{
            cell.textLabel?.text = sports[indexPath.row].headline
            cell.detailTextLabel?.text = "\(sports[indexPath.row].date)"
        }
        
        
        counter++
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedArticle = art.articleData[indexPath.row]
        performSegueWithIdentifier("toArticleWeb", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController = segue.destinationViewController as! ArticlesWebViewController
        destinationViewController.art = selectedArticle
        destinationViewController.cameFrom = 1
    }
}
