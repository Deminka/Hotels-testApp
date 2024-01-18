//
//  Validators.swift
//  Hotels
//
//  Created by mac on 18.01.2024.
//

import Foundation

class Validators {
    
    static func isFilled(firstName: String?, secondName: String?, birthDay: String?, citizenship: String?, pasNumber: String?, pasValidPeriod: String?) -> Bool {
        
        guard let firstName = firstName,
              let secondName = secondName,
              let birthDay = birthDay,
              firstName != "",
              secondName != "",
              birthDay != "",
              citizenship != "",
              pasNumber != "",
              pasValidPeriod != "" else {
            return false
            
        }
        return true
    }
    
    static func isValidEmail(_ email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
