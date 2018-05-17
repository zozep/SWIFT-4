//
//  ViewController.swift
//  NamesToFaces
//
//  Created by Joseph Park on 5/16/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var people = [Person]()
    
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
        return people.count
    }
    
    //This must return an object of type UICollectionViewCell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as! PersonCell
        let person = people[indexPath.item]
        cell.name.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        cell.imageView.layer.borderWidth = 2
        cell.imageView.layer.cornerRadius = 3
        cell.layer.cornerRadius = 7

        return cell
    }

    // MARK: - ImagePicker fx
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //guard to pull out and typecast the image from the image picker, if that fails we want to exit the method immediately
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return
        }
        
        //create an UUID object, and use its uuidString property to extract the unique identifier as a string data type
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        //converts a UIImage to a Data object
        //Data = data type that can hold any type of binary type – image data, zip file data, movie data, and so on
        if let jpegData = UIImageJPEGRepresentation(image, 80) {
            try? jpegData.write(to: imagePath)
        }
        
        //stores image name in the Person object and gives them a default name of "Unknown", before reloading the collection view.
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView?.reloadData()
        dismiss(animated: true)
    }
    
    //All apps that are installed have a directory called Documents where you can save private information for the app
    //it's not obvious how to find that directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        return documentsDirectory
    }

    
}

