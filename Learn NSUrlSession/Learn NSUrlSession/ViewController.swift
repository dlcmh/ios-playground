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

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataTry: String = "" {
        didSet {
            dataLabel.text = dataTry
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        data_request()
        use_me()
    }
    
    func use_me() {
        dataTry = "Loading..."
        
        let url:URL = URL(string: url_to_request)!
        print("\(url)")
        
        let session = URLSession.shared
        print("\(session)")
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        print("\(request)")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            DispatchQueue.main.async {
                self.dataTry = String(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
            }
        })
        
        task.resume()
        
        print("finished!")
    }
    
    func data_request() {
        let url:URL = URL(string: url_to_request)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let paramString = "data=Hello"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(dataString)
            
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

