//
//  ReviewFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct ReviewFinder {
    
    var review_id: Int?
    var customer_id: Int?
    var shop_id: Int?
    var comment1: String?
    var comment2: String?
    var comment3: String?
    var comment4: String?
    var comment5: String?
    var star1: Int?
    var star2: Int?
    var star3: Int?
    var star4: Int?
    var star5: Int?
    var duration_seconds: Int?
    var date: String?
    
    init?(json: Dictionary<String, AnyObject>) {
        if let rid = Int((json["review_id"] as? String)!) {
            self.review_id = rid
        } else {
            self.review_id = 0
        }
        
        if let cid = Int((json["customer_id"] as? String)!) {
            self.customer_id = cid
        } else {
            self.customer_id = 0
        }
        
        if let sid = Int((json["shop_id"] as? String)!) {
            self.shop_id = sid
        } else {
            self.shop_id = 0
        }
        
        if let c1 = json["comment1"] as? String! {
            self.comment1 = c1
        } else {
            self.comment1 = ""
        }
        
        if let c2 = json["comment2"] as? String! {
            self.comment2 = c2
        } else {
            self.comment2 = ""
        }
        
        if let c3 = json["comment3"] as? String! {
            self.comment3 = c3
        } else {
            self.comment3 = ""
        }
        
        if let c4 = json["comment4"] as? String! {
            self.comment4 = c4
        } else {
            self.comment4 = ""
        }
        
        if let c5 = json["comment5"] as? String! {
            self.comment5 = c5
        } else {
            self.comment5 = ""
        }
        
        if let s1 = Int((json["star1"] as? String)!) {
            self.star1 = s1
        } else {
            self.star1 = 0
        }
        
        if let s2 = Int((json["star2"] as? String)!) {
            self.star2 = s2
        } else {
            self.star2 = 0
        }
        
        if let s3 = Int((json["star3"] as? String)!) {
            self.star3 = s3
        } else {
            self.star3 = 0
        }
        
        if let s4 = Int((json["star4"] as? String)!) {
            self.star4 = s4
        } else {
            self.star4 = 0
        }
        
        if let s5 = Int((json["star5"] as? String)!) {
            self.star5 = s5
        } else {
            self.star5 = 0
        }
        
        if let ds = Int((json["duration_seconds"] as? String)!) {
            self.duration_seconds = ds
        } else {
            self.duration_seconds = 0
        }
        
        if let d = json["date"] as? String! {
            self.date = d
        } else {
            self.date = ""
        }
    }
}
