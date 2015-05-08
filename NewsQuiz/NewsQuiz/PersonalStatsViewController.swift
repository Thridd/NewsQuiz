//
//  PersonalStatsViewController.swift
//  NewsQuiz
//
//  Created by Thomas Riddick on 4/16/15.
//  Copyright (c) 2015 Thomas Henry Riddick. All rights reserved.
//

import UIKit

class PersonalStatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let sections = ["Overall Stats", "World Stats", "U.S. Stats", "Politics Stats", "Business Stats", "Technology Stats", "Sports Stats"]
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var backToQuizBtn: UIBarButtonItem!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.backgroundColor = UIColor(netHex:0x666666)
        navigationController?.navigationBar.barTintColor = UIColor(netHex:0x8DCCC0)
        navigationController!.navigationItem.leftBarButtonItem?.tintColor = UIColor.whiteColor()
        navigationController!.navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func backToCatOrQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func backToQuiz(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let statsCell = collectionView.dequeueReusableCellWithReuseIdentifier("StatsCell", forIndexPath: indexPath) as! StatsCollectionViewCell
        
        let score = "34/50"
        let time = "3.00"
        let scoreCons = "Correct Answers"
        let timeCons = "Average Response Time"
        let header = sections[indexPath.section]
        
        statsCell.setStats(score, timeLabelText: time, scoreConstantLabelText: scoreCons, timeConstantLabelText: timeCons, headerText: header)
        
        return statsCell
        
        
    }
}
