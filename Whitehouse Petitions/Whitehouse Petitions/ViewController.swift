//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Joseph Park on 5/11/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var labels = [String: UILabel]()
    var petitions = [[String: String]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
}

