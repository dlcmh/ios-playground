//
//  ViewController.swift
//  TableViewFromScratch
//
//  Created by David Chin on 03/10/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataArray = ["1", "2", "3"]
    var selectedSortOrder = "Ascending"
    var sortedDataArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource(order: selectedSortOrder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func segmentedControlForAscendingDescending(_ sender: AnyObject) {
        selectedSortOrder = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        setDataSource(order: selectedSortOrder)
    }
    
    func setDataSource(order: String) {
        if order == "Descending" {
            sortedDataArray = dataArray.sorted {$0 > $1}
        } else {
            sortedDataArray = dataArray.sorted()
        }
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)

        let content = sortedDataArray[indexPath.row]
        cell.textLabel?.text = content

        return cell
    }
}

