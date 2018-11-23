//
//  UserFieldsValidator.swift
//  TripWireless
//
//  Created by Rashida on 19/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import Foundation

class LoginValidator: Validator {
    
    let emailValidator = EmailValidator()
    let passwordValidator = PasswordValidator()

    func validateWithError(error: NSErrorPointer) -> Bool {
        guard
            emailValidator.validateWithError(error: error),
            passwordValidator.validateWithError(error: error)
        else {
                return false
        }
        return true
    }
}

class ForgetPasswordValidator: Validator {
    
    let passwordValidator = PasswordValidator()
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        guard
            passwordValidator.validateWithError(error: error)
            else {
                return false
        }
        return true
    }
    
}

class RegistrationValidator: Validator {
    
    let firstNameValidator = FirstNameValidator()
    let lastNameValidator = LastNameValidator()
    let emailValidator = EmailValidator()
    let passwordValidator = PasswordValidator()
    let phonNumberValidator = PhoneNumeberValidator()
    let companyNameValidator = CompanyNameValidator()
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        guard
        firstNameValidator.validateWithError(error: error),
        lastNameValidator.validateWithError(error: error),
        passwordValidator.validateWithError(error: error),
        emailValidator.validateWithError(error: error),
        phonNumberValidator.validateWithError(error: error),
        companyNameValidator.validateWithError(error: error)
        
            else {
            return false
        }
        return true
    }
        
    
}

class ResetPasswordValidator: Validator {
    
    let oldPasswordValidator = OldPasswordValidator()
    let newPasswordValidator = NewPasswordValidator()
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        guard
            oldPasswordValidator.validateWithError(error: error),
            newPasswordValidator.validateWithError(error: error)
            else {
                return false
        }
        
        return true
    }
    
    
}


class EmailValidator : Validator {
    
    var input: String?
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        
        if let input = input {
            
            if input.count == 0 {
                error!.pointee = NSError(domain: "email.empty.message".localized(), code: 0, userInfo: nil)
                print((error!.pointee!.domain))
                return false
            } else if input.isValidEmail() == false {
                error?.pointee = NSError(domain: "email.validation.message".localized(), code: 0, userInfo: nil)
                return false
            }
            
        } else {
            // nil
            error?.pointee = NSError(domain: "email.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        
        return true
    }
}

class PasswordValidator : Validator {
    
    var input: String?
    func validateWithError(error: NSErrorPointer) -> Bool {
        if let input = input {
            if input.count == 0 {
                error?.pointee = NSError(domain: "password.empty.message".localized(), code: 0, userInfo: nil)
                return false
            } else if input.count < 6 {
                error?.pointee = NSError(domain: "password.validation.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
           // empty password
            error?.pointee = NSError(domain: "password.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
}

class FirstNameValidator : Validator {
    
    var input : String?
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        
        if let input = input {
            if input.isEmpty {
                error?.pointee = NSError(domain: "firstName.empty.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            error?.pointee = NSError(domain: "firstName.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
}

class LastNameValidator : Validator {
    
    var input : String?
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        
        if let input = input {
            if input.isEmpty {
                error?.pointee = NSError(domain: "lastName.empty.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            error?.pointee = NSError(domain: "lastName.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
}

class PhoneNumeberValidator : Validator {
    
    var input : String?
    func validateWithError(error: NSErrorPointer) -> (Bool) {
        if let input = input {
            if input.count == 0 {
                // empty phone number
                 error?.pointee = NSError(domain: "phoneNumber.empty.message".localized(), code: 0, userInfo: nil)
               // print(error?.pointee?.domain)
                return false
            } else if input.count < 10 {
                // invalid phone number
                 error?.pointee = NSError(domain: "phoneNumber.validation.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            // empty phone number
             error?.pointee = NSError(domain: "phoneNumber.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
}

class CompanyNameValidator : Validator {
    
    var input : String?
    
    func validateWithError(error: NSErrorPointer) -> Bool {
        
        if let input = input {
            if input.isEmpty {
                error?.pointee = NSError(domain: "companyName.empty.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            error?.pointee = NSError(domain: "companyName.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
}

class OldPasswordValidator: Validator {
    
    var input: String?
    func validateWithError(error: NSErrorPointer) -> Bool {
        if let input = input {
            if input.count == 0 {
                error?.pointee = NSError(domain: "oldPassword.empty.message".localized(), code: 0, userInfo: nil)
                return false
            } else if input.count < 6 {
                error?.pointee = NSError(domain: "oldPassword.validation.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            // empty password
            error?.pointee = NSError(domain: "oldPassword.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
    
    
}

class NewPasswordValidator: Validator {
    
    var input: String?
    func validateWithError(error: NSErrorPointer) -> Bool {
        if let input = input {
            if input.count == 0 {
                error?.pointee = NSError(domain: "newPassword.empty.message".localized(), code: 0, userInfo: nil)
                return false
            } else if input.count < 6 {
                error?.pointee = NSError(domain: "newPassword.validation.message".localized(), code: 0, userInfo: nil)
                return false
            }
        } else {
            // empty password
            error?.pointee = NSError(domain: "newPassword.empty.message".localized(), code: 0, userInfo: nil)
            return false
        }
        return true
    }
    
    
}

