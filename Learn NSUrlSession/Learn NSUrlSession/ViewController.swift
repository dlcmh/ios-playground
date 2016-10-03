//
//  ViewController.swift
//  Learn NSUrlSession
//
//  Created by David Chin on 02/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url_to_request:String = "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php"

    @IBOutlet weak var dataLabel1: UILabel!
    @IBOutlet weak var dataLabel2: UILabel!
    
    var data1: String = "" {
        didSet {
            dataLabel1.text = data1
        }
    }

    var data2: String = "" {
        didSet {
            dataLabel2.text = data2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        data_request()
        postMeWithParams(url: "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php")
    }
    
    func postMeWithParams(url: String) {
        data1 = "Loading..."
        
        let endpoint = URL(string: url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            DispatchQueue.main.async {
                self.data1 = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            }
        })
        
        task.resume()
    }

    func postMeWithJSONData(url: String) {
        data2 = "Loading..."
        
        let endpoint = URL(string: url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            DispatchQueue.main.async {
                self.data1 = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            }
        })
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

