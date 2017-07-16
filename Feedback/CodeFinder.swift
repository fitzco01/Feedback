//
//  CodeFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct CodeFinder {
    
    var code_id: Int?
    var shop_id: Int?
    var code: String?
    
    init?(json: Dictionary<String, AnyObject>) {
        if let cid = Int((json["code_id"] as? String)!) {
            self.code_id = code_id
        } else {
            self.code_id = 0
        }
        
        if let sid = Int((json["shop_id"] as? String)!) {
            self.shop_id = sid
        } else {
            self.shop_id = ""
        }
        
        if let c = json["code"] as? String {
            self.code = c
        } else {
            self.code = ""
        }
    }
}
