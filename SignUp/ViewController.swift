//
//  ViewController.swift
//  SignUp
//
//  Created by heaven on 09/10/2017.
//  Copyright © 2017 heaven. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

extension Reactive where Base: UIView {
    public var backgroundColor: Binder<UIColor?> {
        return Binder(self.base) { view, backgroundColor in
            view.backgroundColor = backgroundColor
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Rx
    let disposeBag = DisposeBag()
    
    // MARK: email field
    func configureEmailField() {
        emailField.rx.text
            .map({ $0?.isValidateToEmail ?? false })    //  filterNil, orEmpty
            .map({ $0 ? UIColor.white : UIColor.red })
            .bind(to: emailField.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
    
    // MARK: password field
    func configurePasswordField() {
        passwordField.rx.text
            .map({ $0?.isValidateToPassword ?? false })
            .map({ $0 ? UIColor.white : UIColor.red })
            .bind(to: passwordField.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Login Button
    func configureLoginButtonState() {
        Observable.combineLatest(emailField.rx.text, passwordField.rx.text) { email, password -> Bool in
            return email?.isValidateToEmail ?? false && password?.isValidateToPassword ?? false
        }
        .bind(to: loginButton.rx.isEnabled)
        .disposed(by: disposeBag)
    }
    
    @IBAction func loginButonTouched() {
        
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureEmailField()
        configurePasswordField()
        configureLoginButtonState()
    }
    
}

// MARK: -
// * KVO와 비교

// MARK: -
// * 기존의 코드를 기준으로 접근

// MARK: - Data의 Input, Output으로 생각하시오.
// 1.
// Input: text: String
// Output: color: UIColor

// Input: text: String
// Output: isValid: Bool
//
// Input: isValid: Bool
// Output: color: UIColor

// 2.
// Input: email: String, passworld: String
// Output: isValid: Bool


// MARK: -
// subscribe(onNext:) vs bind(onNext:)
