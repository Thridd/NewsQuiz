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
        if cameFrom == 1{
            var quizBtn : UIBarButtonItem = UIBarButtonItem(title: "Take Quiz", style: UIBarButtonItemStyle.Plain, target: self, action: "takeQuiz:")
            
            self.navigationItem.rightBarButtonItem = quizBtn

        }
        
    }
    
    func takeQuiz(sender: UIBarButtonItem) {
        selectedBtn = 2
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
