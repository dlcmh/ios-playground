//
//  MyDrawView.swift
//  iOS Playground
//
//  Created by David Chin on 03/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class MyDrawView: UIView {

    @IBInspectable var startColor: UIColor = UIColor.whiteColor()
    @IBInspectable var endColor: UIColor = UIColor.redColor()
    @IBInspectable var endRadius: CGFloat = 200
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let locations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(colorspace, [startColor.CGColor, endColor.CGColor], locations)
        
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        
        let startRadius: CGFloat = 0
        
        startPoint.x = 210
        startPoint.y = 180
        
        endPoint.x = 210
        endPoint.y = 200
        
        CGContextDrawRadialGradient(context, gradient, startPoint, startRadius, endPoint, endRadius, .DrawsBeforeStartLocation)
    }

}
