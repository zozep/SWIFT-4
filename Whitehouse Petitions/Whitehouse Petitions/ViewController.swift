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
        
        //urlString points to the Whitehouse.gov server, accessing the petitions system.
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            
            //We create a new String object using its contentsOf method. This returns the content from a URL, but it might throw an error (i.e., if the internet connection was down) so we need to use try?
            if let data = try? String(contentsOf: url) {
                //If the String object was created successfully, we create a new JSON object from it. This is a SwiftyJSON structure.
                let json = JSON(parseJSON: data)
                
                //if there is a "metadata" value and it contains a "responseInfo" value that contains a "status" value, return it as an integer, then compare it to 200
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    parse(json: json)
                }
            }
        }
    }
    
    func parse(json: JSON) {
        
        //
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]

        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]
        return cell
    }
}
