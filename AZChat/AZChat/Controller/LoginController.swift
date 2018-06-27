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
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Name"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 200)
        view.translatesAutoresizingMaskIntoConstraints =  false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        view.addSubview(loginInputView)
        view.addSubview(loginRegisterButton)
        
        setupLoginInputView()
        setuploginRegButton()
    }
    
    func setupLoginInputView() {
        loginInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginInputView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginInputView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        loginInputView.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: loginInputView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: loginInputView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: loginInputView.heightAnchor, multiplier: 1/3).isActive = true
        
        loginInputView.addSubview(nameTextField)
        loginInputView.addSubview(nameSeparatorView)
       
        nameSeparatorView.leftAnchor.constraint(equalTo: loginInputView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setuploginRegButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: loginInputView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginRegisterButton.layer.cornerRadius = 5
        loginRegisterButton.setTitleColor(UIColor.white, for: .normal)
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
