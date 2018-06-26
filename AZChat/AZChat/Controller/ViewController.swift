//
//  ViewController.swift
//  AZChat
//
//  Created by Joseph Park on 6/24/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))

    }
    
    @objc func handleLogOut() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }
}

