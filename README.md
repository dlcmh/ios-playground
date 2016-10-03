[iOS & Swift Tutorial: UITableViewController](https://www.ralfebert.de/tutorials/ios-swift-uitableviewcontroller/)


Drag Table View
Drag & drop Table View Cell on top of Table View
  - Identifier: cellID
  - Style: Basic
Set Table View data source & delegate
  - ctrl, click & drag from Table View area to View Controller icon (yellow in color), and let go of the mouse button
  - Choose Outlets > dataSource
  - repeat and choose Outlets > dataSource
Show the Assistant Editor, drag from the Table View to ViewController.swift to create an `@IBOutlet`.
Open `ViewController.swift` to implement the Table View data source & delegate.
  - Add `, UITableViewDataSource, UITableViewDelegate` to class declaration
  - Set number of sections for the Table View:
    - `func numberOfSections(in tableView: UITableView) -> Int { return 1 }`
  - Set number of rows in each Table View section:
    - `func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return dataArray.count }`
