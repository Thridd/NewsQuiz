//
//  ArticlesWebViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class ArticlesWebViewController: UIViewController {

    @IBOutlet weak var quizOrArticlesBtn: UIBarButtonItem!
    @IBOutlet weak var takeQuizBtn: UIBarButtonItem!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var articleViewer: UIWebView!
   
    
    var art: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(art != nil) {
            if let url = art?.url{
                let fullURL = NSURL(string: url)
                let urlRequest = NSURLRequest(URL: fullURL!)
                if let check = art?.articleCat{
                    navigationItem.title = check
                }
                articleViewer.loadRequest(urlRequest)
            }
        }
        

    }

    
    @IBAction func backToQuizOrArticles(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func toQuiz(sender: AnyObject) {
        performSegueWithIdentifier("takeQuiz", sender: self)

    }


}
