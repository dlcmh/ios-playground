//
//  ViewController.swift
//  iOS Playground
//
//  Created by David Chin on 02/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scaleFactor: CGFloat = 2
    var angle: Double = 180
    var boxView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameRect = CGRectMake(20, 20, 45, 45)
        
        boxView = UIView(frame: frameRect)
        boxView?.backgroundColor = UIColor.blueColor()
        view.addSubview(boxView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.locationInView(view)
                        
            UIView.animateWithDuration(
                0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut,
                animations: {
                    let scaleTrans = CGAffineTransformMakeScale(self.scaleFactor, self.scaleFactor)
                    let rotateTrans = CGAffineTransformMakeRotation(CGFloat(self.angle * M_PI / 180))
                    self.boxView!.transform = CGAffineTransformConcat(scaleTrans, rotateTrans)
                    self.angle = (self.angle == 180 ? 360 : 180)
                    self.scaleFactor = (self.scaleFactor == 2 ? 1 : 2)
                    self.boxView!.center = location
                },
                completion: nil)
        }
    }

}

