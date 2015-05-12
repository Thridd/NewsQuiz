//
//  Articles.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/21/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

struct Article {
    var articleCat:String
    var headline:String
    var author:String
    var date:String
    var cDeck:String
    var url:String
    var question:String
    var correctAns:String
    var wrongAns1:String
    var wrongAns2:String
    var wrongAns3:String
}

class Articles: NSObject {
    
    //No ? or ! means you assume that you have a value in this of that type.  This case it doesnt matter, if youre pulling data off the internet however then it could not have data and would fail and therefore optionals would be necessary
   
    
    var articleData:[Article] = [Article]()
    override init()
    {
        
        super.init()
        let path  = "articles"
        var jsonError: NSError?
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json"){
            
            if let url = NSURL(fileURLWithPath: filePath){
                let urlRequest = NSMutableURLRequest(URL: url)
                getJson(urlRequest, callback: {
                    (data, error) -> Void in
                    if error != nil {
                        println(error)
                    } else {
                        if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSArray{
                            for singleArticle in jsonResult{
                                if let articleCat = singleArticle["Article category"] as? String{
                                    if let headline = singleArticle["Headline"] as? String{
                                        if let author = singleArticle["Author"] as? String{
                                            if let date = singleArticle["Date"] as? String{
                                                if let cDeck = singleArticle["C-deck"] as? String{
                                                    if let url = singleArticle["URL"] as? String{
                                                        if let question = singleArticle["Question"] as? String{
                                                            if let correctAns = singleArticle["Correct answer"] as? String{
                                                                if let wa1 = singleArticle["Incorrect answer A"] as? String{
                                                                    if let wa2 = singleArticle["Incorrect answer B"] as? String{
                                                                        if let wa3 = singleArticle["Incorrect answer C"] as? String{
                                                                            let aData = Article(articleCat: articleCat, headline: headline, author: author, date: date, cDeck: cDeck, url: url, question: question, correctAns: correctAns, wrongAns1: wa1, wrongAns2: wa2, wrongAns3: wa3)
                                                                            
                                                                            self.articleData.append(aData)
                                                                            
                                                                            
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            }
                            
                            
                        }
                        
                    }
                })
            }
            
        }
    
        
       
    }
    func getJson(urlRequest: NSURLRequest!, callback: (NSData, String?) -> Void) {
        //Returns NSURLSession object (every app has one this is just asking for it)
        var session = NSURLSession.sharedSession()
        
        //Once dataTaskWithRequest it calls completionHandler an anon function defined below
        var task = session.dataTaskWithRequest(urlRequest, completionHandler: {
            (data, response, error) -> Void in
            if error != nil {
                callback(NSData(), error.localizedDescription)
            } else {
                
                callback(data, nil)
            }
        })
        
        // The following uses a trailing closure.  This can be used as an alternative to the above.
        /*
        var task = session.dataTaskWithRequest(urlRequest){
        (data, response, error) -> Void in
        if error != nil {
        callback(NSData(), error.localizedDescription)
        } else {
        callback(data, nil)
        }
        }
        */
        task.resume()
    }
    
    
    
    
    
}


