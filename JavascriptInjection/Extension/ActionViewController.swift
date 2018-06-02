//
//  ActionViewController.swift
//  Extension
//
//  Created by Joseph Park on 5/31/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //extensionContext lets us control how it interacts with the parent app
        //In the case of inputItems this will be an array of data the parent app is sending to our extension to use
        //We only care about this first item, and even then it might not exist -> conditionally typecast using if let and as?
        if let inputItem = extensionContext!.inputItems.first as? NSExtensionItem {
            //Input item contains an array of attachments, which are given to us wrapped up as an NSItemProvider
            //Code pulls out the first attachment from the first input item
            if let itemProvider = inputItem.attachments?.first as? NSItemProvider {
                //to ask the item provider to actually provide us with its item
                //it uses a closure so this code executes asynchronously
                //the method will carry on executing while the item provider is busy loading and sending us its data.
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) {
                    //[unowned self] to avoid strong reference cycles
                    //also need to accept two parameters: the dictionary given to us to by the item provider
                    //and any error that occurred.
                    
                    //With the item successfully pulled out, we can get to the interesting stuff
                    [unowned self] (dict, error) in
                    // do stuff!
                }
            }
        }
        
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }

}
