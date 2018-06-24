//
//  LoginController.swift
//  AZChat
//
//  Created by Joseph Park on 6/24/18.
//  Copyright © 2018 Joseph Park. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let loginInputView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        view.addSubview(loginInputView)
        setupLoginInputView()
    }
    
    func setupLoginInputView() {
        loginInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginInputView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginInputView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
