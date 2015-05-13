//
//  ViewController.swift
//  Mayors
//
//  Created by Jide Opeola on 3/5/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

import UIKit
import Crashlytics

let AUTH_URL = "https://foursquare.com/oauth2/authenticate?client_id=NC14IVHAH0HBQFOUPH0QHP2JNZWWH4CAVCI43WFLH0PRVAXJ&response_type=token&redirect_uri=mayors://mayors.com"


class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func foursquareConnect(sender: AnyObject) {
        
        if let url = NSURL(string: AUTH_URL) {

        UIApplication.sharedApplication().openURL(url)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserverForName("FSConnectWithToken", object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            // code is ran after token is set
            
    //        println(FoursquareModel.mainModel().token)
            
            let ME_URL = "https://api.foursquare.com/v2/users/self"
            
            let rManager = AFHTTPRequestOperationManager()
            
            rManager.GET(ME_URL, parameters: ["oauth_token":FoursquareModel.mainModel().token!,"v":"20150311","m":"foursquare"], success: { (operation, response) -> Void in
                
                println(response)
                
//                let resultInfo = response as [String:AnyObject]
//                let responseInfo = resultInfo["response"] as [String:AnyObject]
//                let userInfo = responseInfo["user"] as [String:AnyObject]
//                
//                let firstName = userInfo["firstName"] as String
//                let lastName = userInfo["lastName"] as String
//                
//                self.welcomeLabel.text = "Welcome \(firstName) \(lastName)"
                
                let user = User(resultInfo: response as! [String:AnyObject])
                
                self.welcomeLabel.text = "Welcome \(user.firstName) \(user.lastName)"
                
            }, failure: { (operation, error) -> Void in
                
                println(error)
                
            })
            
            
            
        }
        
        // AF Networking library
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//       let manager = AFHTTPRequestOperationManager()
//        
//        manager.GET("http://jo2.co/twitter.json", parameters: nil, success: { (operation, responseObject) -> Void in
//            
//            
//            
//        }) { (operation, error) -> Void in
//            
//            
//            
//        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

