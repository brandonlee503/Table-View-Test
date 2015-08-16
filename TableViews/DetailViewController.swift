//
//  DetailViewController.swift
//  TableViews
//
//  Created by Brandon Lee on 8/14/15.
//  Copyright (c) 2015 Brandon Lee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    /* PROPERTY OBSERVER
    * Observes and responds to changes in a property's value. There are two types of property observers,
    * willSet - which is called right before a value is stored,
    * didSet - which is called right after a value is stored.
    * Property observers are called everytime a property's values are set, even if the value is the same.
    * We can use these observers to execute code whenever a value is about to be set, or has been set.
    */
    
    var detailItem: AnyObject? {
        didSet {
            // Every time a value is assigned, self.configureView() is called right after
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Method called again after view is fully loaded
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

