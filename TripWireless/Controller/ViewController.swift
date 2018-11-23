//
//  ViewController.swift
//  TripWireless
//
//  Created by Rashida on 19/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userBusiness = UserBusiness()
    var fieldError: NSError?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     // self.usernameValidation(input: "123")
     print("email.empty.message".localized())
    }
    
    
    func validateFields() -> Bool {
        guard
            usernameValidation(input: "emailField.text")
            else {
                return false
        }
        return true
    }
    
    func usernameValidation(input: String?) -> (Bool) {
        
        // email
        self.userBusiness.registrationValidator.phonNumberValidator.input = input
        
        if userBusiness.registrationValidator.phonNumberValidator.validateWithError(error: &fieldError) == false {
           // show error as (fieldError!.domain)
            print(fieldError?.domain)
            return false
        }
        
        return true
    }


}

