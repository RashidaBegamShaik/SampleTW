//
//  Validator.swift
//  Cottrell


import Foundation

protocol Validator {

    func validateWithError(error: NSErrorPointer) -> Bool
    
}

