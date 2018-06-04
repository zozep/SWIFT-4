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

    @IBOutlet weak var script: UITextView!
    var pageTitle = ""
    var pageURL = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
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
                    let itemDictionary = dict as! NSDictionary
                    let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as! NSDictionary
                    self.pageTitle = javaScriptValues["title"] as! String
                    self.pageURL = javaScriptValues["URL"] as! String
                    
                    //This is needed because the closure being executed as a result of loadItem(forTypeIdentifier:) could be called on any thread, and we don't want to change the UI unless we're on the main thread.
                    DispatchQueue.main.async {
                        self.title = self.pageTitle
                    }
                }
            }
        }
    }
        
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            script.contentInset = UIEdgeInsets.zero
        } else {
            script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        script.scrollIndicatorInsets = script.contentInset
        
        let selectedRange = script.selectedRange
        script.scrollRangeToVisible(selectedRange)
    }

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]
        
        extensionContext!.completeRequest(returningItems: [item])
    }

}
