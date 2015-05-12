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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let articleData = appDelegate.getArticleData()
        
        //for var i = 0; i < articleData.articleData.count; i+=3 {
        //   categories.append(articleData.articleData[i].articleCat)
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return art.articleData.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = art.articleData[indexPath.row].headline
        cell.detailTextLabel?.text = "\(art.articleData[indexPath.row].date)"
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
