//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Joseph Park on 5/3/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //We don’t need to unwrap selectedImage here because both selectedImage and title are optional strings – we’re assigning one optional string to another. title is optional because it’s nil by default: view controllers have no title, thus showing no text in the navigation bar.
        title = selectedImage
        
        //load images
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
