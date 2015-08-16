//
//  MasterViewController.swift
//  TableViews
//
//  Created by Brandon Lee on 8/14/15.
//  Copyright (c) 2015 Brandon Lee. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    let fruits = ["Apples", "Bananas", "Oranges", "Pineapples", "Watermelons", "Strawberries", "Raspberries", "Grapes", "Pomegranates", "Peaches", "Cherries", "Dates"]

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let fruit = fruits[indexPath.row]
            (segue.destinationViewController as! DetailViewController).detailItem = fruit
            }
        }
    }

    /* HIGH LEVEL OVERVIEW
     * Tableviews are instances of the UITableView controller class.  UITableViewController conforms to UITableView
     * data source protocol, which helps the tableview controller construct the view, by communicating with the app's data model.
     * The protocol has two required methods, one that helps the tableview determine how many rows to create, which
     * it does by querying the data model for its size.  And a second that creates a cell for a particular row, supplies
     * the relevant information from the data model, and then adds it to the row.  The tableview knows what info pertains
     * to which row by using an IndexPath.  An IndexPath associated with the tableview stores indexes for specific sections
     * and rows in the tableview.  The tableview then uses this IndexPath to retrieve data from the data model and populate
     * the view.
     */
    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let fruit = fruits[indexPath.row]
        cell.textLabel!.text = fruit
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}

