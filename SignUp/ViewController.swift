//
//  ViewController.swift
//  SignUp
//
//  Created by heaven on 09/10/2017.
//  Copyright © 2017 heaven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: email field
    func configureEmailField() {
        emailField.addTarget(self, action: #selector(emailFieldChanged(_:)), for: .editingChanged)
    }
    
    @objc func emailFieldChanged(_ sender: UITextField) {
        sender.backgroundColor = sender.text?.isValidateToEmail ?? false ? .white : .red
        
        updateLoginButtonState()
    }
    
    // MARK: password field
    func configurePasswordField() {
        passwordField.addTarget(self, action: #selector(passwordFieldChanged(_:)), for: .editingChanged)
    }
    
    @objc func passwordFieldChanged(_ sender: UITextField) {
        sender.backgroundColor = sender.text?.isValidateToPassword ?? false ? .white : .red
        
        updateLoginButtonState()
    }
    
    // MARK: - Login Button
    func updateLoginButtonState() {
        loginButton.isEnabled = (emailField.text?.isValidateToEmail ?? false) && (passwordField.text?.isValidateToPassword ?? false)
    }
    
    @IBAction func loginButonTouched() {
        
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEmailField()
        configurePasswordField()
    }

}

// MARK: -
// * KVO와 비교
