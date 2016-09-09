//
//  MasterViewController.swift
//  Storm Viewer
//
//  Created by David Chin on 10/09/2016.
//  Copyright © 2016 Dakerr Consulting. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = NSFileManager.defaultManager()
        let path = NSBundle.mainBundle().resourcePath!
        let items = try! fm.contentsOfDirectoryAtPath(path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                objects.append(item)
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {

                // let object = objects[indexPath.row] // <- was
                let navigationController = segue.destinationViewController as! UINavigationController // <- replaced with

                // let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController // <- was
                let controller = navigationController.topViewController as! DetailViewController // <- replaced with
                
                // controller.detailItem = object // <- was
                controller.detailItem = objects[indexPath.row] // <- replaced with
                
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


}

