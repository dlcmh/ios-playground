//
//  DetailViewController.swift
//  Whitehouse Petitions
//
//  Created by David Chin on 13/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import WebKit
import UIKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard detailItem != nil else { return }
        
        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name =\"viewport\" content=\"width=device=width, initial-scale=1\">"
            html += "<style> body { font-size: 150% } </style>"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
        
    }

}

