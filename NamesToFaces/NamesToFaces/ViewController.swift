//
//  ViewController.swift
//  NamesToFaces
//
//  Created by Joseph Park on 5/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))

    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        
        //allows the user to crop the picture they select
        picker.allowsEditing = true
        
        //set self as the delegate = need to conform to UIImagePickerControllerDelegate & UINavigationControllerDelegate protocols
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    // MARK: - CollectionView fx
    //This must return an integer, and tells the collection view how many items you want to show in its grid
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //This must return an object of type UICollectionViewCell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell
        return cell
    }

    // MARK: - ImagePicker fx
    // TODO: - Extract the image from the dictionary that is passed as a parameter.
    // TODO: - Generate a unique filename for it.
    // TODO: - Convert it to a JPEG, then write that JPEG to disk.
    // TODO: - Dismiss the view controller.

    
}

