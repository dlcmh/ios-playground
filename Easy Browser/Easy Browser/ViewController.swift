//
//  ViewController.swift
//  Easy Browser
//
//  Created by David Chin on 11/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView! // the ! at the end of WKWebView is needed because the property starts out as `nil` before being set later on -> otherwise `class ViewController` line will have a 'Class ViewController has no initializers' error
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self // Dear `WKWebView`, when any web page navigation happens, please tell me. -> add `, WKNavigationDelegate` to `class ViewController` line, otherwise this line will show a 'Cannot assign value of type ViewController to type WKNavigationDelegate?'
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://" + websites[0])
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.allowsBackForwardNavigationGestures = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: #selector(openTapped))
        
        // KVO setup for progressView
        // self: who the observer is (we're the observer, so we use self)
        // forKeyPath (rather than forProperty) - allows for chaining of property names (eg averaging all elements in an array)
        // context: if you provide a unique value, that same context value gets sent back to you when you get your notification that the value has changed. This allows you to check the context to make sure it was your observer that was called.
        // Once you have registered as an observer using KVO, you must implement a method called observeValueForKeyPath()
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        
        // Need to wrap progressView inside a bar button item before using it inside toolbarItems
        progressView = UIProgressView(progressViewStyle: .Default)
        progressView.sizeToFit() // tells the progress view set its layout size so that it fits its contents fully
        let progressButton = UIBarButtonItem(customView: progressView) // wrapping happens here

        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: #selector(webView.reload))

        toolbarItems = [progressButton, spacer, refresh] // you'll see the refresh button neatly aligned to the right – that's the effect of the flexible space automatically taking up as much room as it can on the left
        navigationController?.toolbarHidden = false
    }
    
    // Once you have registered as an observer using KVO, you must implement a method called observeValueForKeyPath()
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress" {
            let progress = Float(webView.estimatedProgress)
            progressView.progress = progress
            print(progress)
            if progress == 1.0 {
                progressView.hidden = true
            } else {
                progressView.hidden = false
            }
        }
    }
    
    func openTapped() {
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .ActionSheet)
//        ac.addAction(UIAlertAction(title: "apple.com", style: .Default, handler: openPage))
//        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .Default, handler: openPage))
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        // ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem // add this if coding for iPad / Universal devices
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func openPage(action: UIAlertAction!) {
        let url = NSURL(string: "https://" + action.title!)
        webView.loadRequest(NSURLRequest(URL: url!))
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.URL
        
        if let host = url?.host {
            for website in websites {
                if host.rangeOfString(website) != nil {
                    decisionHandler(.Allow)
                    return
                }
            }
        }
        
        decisionHandler(.Cancel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

