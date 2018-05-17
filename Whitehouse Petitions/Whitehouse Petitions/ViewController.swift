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
        performSelector(inBackground: #selector(fetchJSON), with: nil)
    }
    
    @objc func fetchJSON() {
        //urlString points to the Whitehouse.gov server, accessing the petitions system.
        let urlString: String
        
        //adjusts the code so that the first instance of ViewController loads the original JSON,
        //and the second loads only petitions that have at least 10,000 signatures.
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        if let url = URL(string: urlString) {
                if let data = try? String(contentsOf: url) {
                    let json = JSON(parseJSON: data)
                    
                    if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                        self.parse(json: json)
                        return
                    }
                }
            }
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    func parse(json: JSON) {
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let body = result["body"].stringValue
            let sigs = result["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            
            petitions.append(obj)
        }
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)

    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
