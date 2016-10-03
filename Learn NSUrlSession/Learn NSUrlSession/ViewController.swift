//
//  ViewController.swift
//  Learn NSUrlSession
//
//  Created by David Chin on 02/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jwtLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        postMeWithJSONData(url: "https://brickler-s.herokuapp.com/user/signin")
    }
    
    // http://icodealot.com/sending-http-post-requests-to-ords-from-swift/
    func postMeWithJSONData(url: String) {
        do {
            let loginDict = ["auth": ["email": "user1@a.com", "password": "12345678"]]
            
            let jsonData = try JSONSerialization.data(withJSONObject: loginDict, options: [])
            
            jwtLabel.text = "Loading..."
            
            let endpoint = URL(string: url)!
            
            let request = NSMutableURLRequest(url: endpoint)
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data, response, error) in
                do {
                    // https://developer.apple.com/swift/blog/?id=37
                    let jsonWithObjectRoot = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(jsonWithObjectRoot)
                    if let dictionary = jsonWithObjectRoot as? [String: Any] {
                        if let jwt = dictionary["jwt"] as? String {
                            DispatchQueue.main.async {
                                self.jwtLabel.text = jwt
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
    }
}

