//
//  ViewController.swift
//  StormViewer
//
//  Created by Joseph Park on 5/3/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // data type that lets us work with the filesystem
        let fm = FileManager.default
        
        // bundle = directory containing compiled program and all assets
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //add to the pictures array all the files we match inside our loop.
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    
    //:TABLEVIEW
    
    //there be as many table rows as there are pictures
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //specify what each row should look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        //give the text label of the cell the same text as a picture in our array
        //do this only if there is an actual text label there, or do nothing otherwise
        cell.textLabel?.text = pictures[indexPath.row]
        
        //this method expects a table view cell to be returned, so we need to send back the one we created
        return cell
    }
    
    

    

}

