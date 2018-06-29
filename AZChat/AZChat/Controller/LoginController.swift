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
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 200)
        view.translatesAutoresizingMaskIntoConstraints =  false
        return view
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let emailSeparatorView: UIView = {
        let emailSepView = UIView()
        emailSepView.backgroundColor = UIColor(r: 220, g: 220, b: 200)
        emailSepView.translatesAutoresizingMaskIntoConstraints =  false
        return emailSepView
    }()
    
    let passwordTextField: UITextField = {
        let pwTextfield = UITextField()
        pwTextfield.placeholder = "Password"
        pwTextfield.translatesAutoresizingMaskIntoConstraints = false
        pwTextfield.isSecureTextEntry = true
        return pwTextfield
    }()
    
    let profileImageView: UIView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "orgami50")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 100, g: 200, b: 170)
        view.addSubview(loginInputView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        
        setupLoginInputView()
        setuploginRegButton()
        setupProfileImageView()
    }
    
    func setupProfileImageView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginInputView.topAnchor, constant: -120).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupLoginInputView() {
        
        loginInputView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginInputView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginInputView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //throw in all the views
        loginInputView.addSubview(nameTextField)
        loginInputView.addSubview(nameSeparatorView)
        loginInputView.addSubview(emailTextField)
        loginInputView.addSubview(emailSeparatorView)
        loginInputView.addSubview(passwordTextField)
        
        nameTextField.leftAnchor.constraint(equalTo: loginInputView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: loginInputView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: loginInputView.heightAnchor, multiplier: 1/3).isActive = true

        nameSeparatorView.leftAnchor.constraint(equalTo: loginInputView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: loginInputView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: loginInputView.heightAnchor, multiplier: 1/3).isActive = true
        
        emailSeparatorView.leftAnchor.constraint(equalTo: loginInputView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: loginInputView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginInputView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: loginInputView.heightAnchor, multiplier: 1/3).isActive = true

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
