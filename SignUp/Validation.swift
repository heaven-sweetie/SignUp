//
//  Validation.swift
//  Login
//
//  Created by ParkSunJae on 2017. 10. 7..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

protocol EmailValidation {
    var isValidateToEmail: Bool { get }
}

extension String: EmailValidation {
    var isValidateToEmail: Bool {
        return count > 5
        
//        let name = "[a-z0-9!#$%&'*+/=?^_`{|}~]"
//        let server = "[a-z0-9\\.-]"
//        let pattern = "^\(name)+([\\.-]?\(name)+)*@\(server)+([\\.-]?\(server)+)*(\\.\\w{2,3})+$"
//
//        return range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
    }
}

protocol PasswordValidation {
    var isValidateToPassword: Bool { get }
}

extension String: PasswordValidation {
    var isValidateToPassword: Bool {
        return count > 5
    }
}

