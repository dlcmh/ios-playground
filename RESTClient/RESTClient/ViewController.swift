//
//  ViewController.swift
//  RESTClient
//
//  Created by David Chin on 05/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var serverResponseView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        serverResponseView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onFetchData(sender: UIButton) {
        let serviceURL: String = "https://hacker-news.firebaseio.com/v0/topstories.json"
        let url: NSURL! = NSURL(string: serviceURL)
        let request: NSMutableURLRequest = NSMutableURLRequest(URL: url)

        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15.0

        let session: NSURLSession! = NSURLSession(configuration: configuration, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())

        let task: NSURLSessionDataTask! = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            if data != nil {
                let decodedString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                self.serverResponseView.text = decodedString as! String
            }
        })

        task.resume()
    }
}

