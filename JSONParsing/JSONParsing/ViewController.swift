//
//  ViewController.swift
//  JSONParsing
//
//  Created by David Chin on 06/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    let jsonData: String = "[\n" +
        "{\n" +
            "\"genus\": \"Malus\",\n" +
            "\"title\": \"Apple\"\n" +
        "},\n" +
        "{\n" +
            "\"genus\": \"Musa\",\n" +
            "\"title\": \"Banana\"\n" +
        "},\n" +
        "{\n" +
            "\"genus\": \"Citrus\",\n" +
            "\"title\": \"Orange\"\n" +
        "},\n" +
        "{\n" +
            "\"genus\": \"Pyrus\",\n" +
            "\"title\": \"Pear\"\n" +
        "}\n" +
    "]"

    var items = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // http://stackoverflow.com/questions/24039868/creating-nsdata-from-nsstring-in-swift
        let nsdata = jsonData.dataUsingEncoding(NSUTF8StringEncoding)
        items = try! NSJSONSerialization.JSONObjectWithData(
            nsdata!, options: NSJSONReadingOptions()
        ) as! [[String : AnyObject]]
        
//        textView.text = String(items[0]["genus"]) // => Optional(Malus)
//        textView.text = String(items[0]["genus"]!) // => Malus
          textView.text = items[0]["genus"] as? String // => Malus
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

