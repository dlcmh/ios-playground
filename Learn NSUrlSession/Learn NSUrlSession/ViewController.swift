//
//  ViewController.swift
//  Learn NSUrlSession
//
//  Created by David Chin on 02/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

//        postMeWithParams(url: "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php")
        postMeWithJSONData(url: "https://brickler-s.herokuapp.com/user/signin")
    }
    
    func postMeWithParams(url: String) {
        data1 = "Loading..."
        
        let endpoint = URL(string: url)!
        let request = NSMutableURLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
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

    // http://icodealot.com/sending-http-post-requests-to-ords-from-swift/
    func postMeWithJSONData(url: String) {
        do {
            let loginDict = ["auth": ["email": "user1@a.com", "password": "12345678"]]
            
            let jsonData = try JSONSerialization.data(withJSONObject: loginDict, options: [])
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            if let dictFromJSON = decoded as? [String: [String: String]] {
                print(dictFromJSON)
            }
            
            data2 = "Loading..."
            
            let endpoint = URL(string: url)!
            
            let request = NSMutableURLRequest(url: endpoint)
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data, response, error) in
//                print("Got data \(data) and response \(response) with error \(error)")
                do {
                    // https://developer.apple.com/swift/blog/?id=37
                    let jsonWithObjectRoot = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonWithObjectRoot)
                    if let dictionary = jsonWithObjectRoot as? [String: Any] {
                        if let jwt = dictionary["jwt"] as? String {
                            DispatchQueue.main.async {
                                self.data2 = jwt
                            }
                        }
                    }
                } catch let error as NSError {
                    print("\(error)")
                }
            })
            
            task.resume()
        } catch let error as NSError {
            print("Error \(error) encountered with JSON Serialization.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

