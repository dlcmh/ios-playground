//
//  ViewController.swift
//  TableViewDataSource
//
//  Created by David Chin on 09/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Per http://stackoverflow.com/questions/29421614/should-iboutlet-be-weak-or-strong-var/34212435#34212435
    // & https://developer.apple.com/videos/play/wwdc2015/407/?time=1943
    // storage type should be strong, not weak - the default has been changed to strong in newer Xcode versions.
    @IBOutlet var tableView: UITableView!
    
    let dataSource = SettingsTableViewDataSource(sections: Model.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

