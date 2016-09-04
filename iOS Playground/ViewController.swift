//
//  ViewController.swift
//  iOS Playground
//
//  Created by David Chin on 02/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boxView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameRect = CGRectMake(20, 50, 120, 200)
        
        boxView = UIView(frame: frameRect)
        boxView?.backgroundColor = UIColor.blueColor()
        view.addSubview(boxView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

