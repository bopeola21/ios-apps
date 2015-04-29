//
//  ViewController.swift
//  Archive
//
//  Created by Jide Opeola on 2/26/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

import UIKit

private let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)[0] as! String

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    //    println(documentsDirectoryPath)
        
        loadDots()
        
        NSNotificationCenter.defaultCenter().addObserverForName("appIsClosing", object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            self.saveDots()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let dotsData = documentsDirectoryPath + "/dot1s.data"

    func saveDots() {
        
        let bView = self.view as! BoardView
        // get the dots from boardview 
        // archive dots to file path
        NSKeyedArchiver.archiveRootObject(bView.dots, toFile: dotsData)
        
        
    }
    
    func loadDots() {
        
        let bView = self.view as! BoardView
        // get file path for dots archive 
        // unarchive file path to dots array 
        // set boardview dots
        
        if let dots = NSKeyedUnarchiver.unarchiveObjectWithFile(dotsData) as? [Dot] {
            
            bView.dots = dots
            bView.setNeedsDisplay()
            
        }
        
    }

}

