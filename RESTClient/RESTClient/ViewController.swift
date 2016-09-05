//
//  ViewController.swift
//  RESTClient
//
//  Created by David Chin on 05/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var radiusField: UITextField!
    @IBOutlet weak var serverResponseView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleBackgroundTap(_:)))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        serverResponseView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDismissKeyboard(sender: UITextField) {
        radiusField.resignFirstResponder()
    }
    
    func handleBackgroundTap(sender: UITapGestureRecognizer) {
        radiusField.resignFirstResponder()
    }

    @IBAction func onCalculateArea(sender: UIButton) {
        let radius: String = radiusField.text!

        if radius.isEmpty {
            return;
        }
        
        let serviceURL: String = "http://www.asmtechnology.com/MathService/CircleArea/?radius=\(radius)"
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

