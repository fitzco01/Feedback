//
//  ShopperFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct ShopperFinder {
    
    var customer_id: Int?
    var email: String?
    var activation_code: String?
    
    init?(json: Dictionary<String, AnyObject>) {
        if let cid = Int((json["customer_id"] as? String)!) {
            self.customer_id = cid
        } else {
            self.customer_id = 0
        }
        
        if let e = json["email"] as? String {
            self.email = e
        } else {
            self.email = ""
        }
        
        if let ac = json["activation_code"] as? String {
            self.activation_code = ac
        } else {
            self.activation_code = ""
        }
    }
}
