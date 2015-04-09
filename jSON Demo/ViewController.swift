//
//  ViewController.swift
//  jSON Demo
//
//  Created by HoodsDream on 4/9/15.
//  Copyright (c) 2015 HoodsDream. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url:NSURL = NSURL(string:"http://www.telize.com/geoip")!
        
        var session =  NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: { data, response, error -> Void in
            
            println("task completed")
            
            if error != nil {
                
                println(error)
                
            }
                
            var err:NSError?
                
            var jsonReturn = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as  NSDictionary
            
            var ip:String = jsonReturn["ip"] as String
                
            println("My ip is \(ip)")

            
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

