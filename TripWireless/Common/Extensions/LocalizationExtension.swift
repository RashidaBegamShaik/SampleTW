//
//  LocalizationExtension.swift
//  TripWireless
//
//  Created by Rashida on 21/11/18.
//  Copyright © 2018 Rashida. All rights reserved.
//

import Foundation

extension String {
    
    public func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self, comment: "")
    }
}
