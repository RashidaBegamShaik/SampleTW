//
//  UserProfileBusiness.swift
//  TripWireless
//
//  Created by Rashida on 19/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import Foundation

class UserBusiness {
    
    private(set) lazy var loginValidator = LoginValidator()
    private(set) lazy var registrationValidator = RegistrationValidator()
    private(set) lazy var forgetPasswordValidator = ForgetPasswordValidator()

}
