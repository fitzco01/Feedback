//
//  ShopFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct ShopFinder {
    
    var shop_id: Int?
    var name: String?
    var email: String?
    var password: String?
    
    init?(json: Dictionary<String, AnyObject>) {
        if let sid = Int((json["shop_id"] as? String)!) {
            self.shop_id = sid
        } else {
            self.shop_id = 0
        }
        
        if let n = json["name"] as? String {
            self.name = n
        } else {
            self.name = ""
        }
        
        if let e = json["email"] as? String {
            self.email = e
        } else {
            self.email = ""
        }
        
        if let p = json["password"] as? String {
            self.password = p
        } else {
            self.password = ""
        }
    }
}
