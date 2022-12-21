//
//  ValidationError.swift
//  Teddit
//
//  Created by prk on 12/20/22.
//

import Foundation

class ValidationError: Error {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    
    public var localizedDescription: String {
        return message
    }
    
}
