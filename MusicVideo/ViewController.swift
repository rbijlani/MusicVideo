//
//  ViewController.swift
//  MusicVideo
//
//  Created by Ravi Bijlani on 6/5/16.
//  Copyright © 2016 ROAR Smart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var videos = [Videos]()
    
   
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChange", object: nil)
        
        reachabilityStatusChanged()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/json",
                       completion: didLoadData)
    }
    
    
    func reachabilityStatusChanged () {
        
        switch reachbilityStatus {
        case NOACCESS : view.backgroundColor = UIColor.redColor()
        displayLabel.text = "No Internet"
        case WIFI : view.backgroundColor = UIColor.greenColor()
        displayLabel.text = "Reachable with WIFI"
        case NOACCESS : view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachable with Cellular"
        default:return
        }
    }
    
    // Is called just as object is about to be deallocated
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }
    

    func didLoadData(videos: [Videos]) {
        
        print(reachbilityStatus)
        
//        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
//        
//        let okAction = UIAlertAction(title: "Ok", style: .Default) {action -> Void in}
//        
//        alert.addAction(okAction)
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//        print(result)
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
 
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
    }
    
    
}

