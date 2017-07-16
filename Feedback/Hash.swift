//
//  Hash.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 3/25/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation
import CryptoSwift

class Hash {
    func hash(string: String) -> String {
        return string.sha512()
    }
    
    func codeGenerator(length: Int) -> String {
        let passwordMaterial : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let passwordMaterialLength = UInt32(passwordMaterial.length)
        
        var returnValue = ""
        
        for _ in 0 ..< passwordLength {
            let randomPosition = arc4random_uniform(passwordMaterialLength)
            var character = passwordMaterial.character(at: Int(randomPosition))
            returnValue += NSString(characters: &character, length: 1) as String
        }
        
        return returnValue
    }
}
