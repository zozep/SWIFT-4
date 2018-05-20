//
//  ViewController.swift
//  InstaFilters
//
//  Created by Joseph Park on 5/17/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var intensity: UIButton!
    
    var currentImage: UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "YACIFP"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
    }


    @IBAction func changeFilter() {
        //code
        print("changeFilter()")
    }

    
    @IBAction func save(_ sender: Any) {
        //code
        print("save()")
    }
    
    @IBAction func intensityChanged(_ sender: Any) {
        //code
        print("intensityCHanged()")
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: - ImagePicker fx
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        dismiss(animated: true)
        currentImage = image
    }
    
}
