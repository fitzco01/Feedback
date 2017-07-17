//
//  QuestionFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/16/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

//
//  ReviewFinder.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

struct QuestionFinder {
    
    var question_id: Int?
    var shop_id: Int?
    var question1: String?
    var question2: String?
    var question3: String?
    var question4: String?
    var question5: String?
    var star1: Bool?
    var star2: Bool?
    var star3: Bool?
    var star4: Bool?
    var star5: Bool?
    var timer: Bool?
    
    init?(json: Dictionary<String, AnyObject>) {
        if let rid = Int((json["question_id"] as? String)!) {
            self.review_id = rid
        } else {
            self.review_id = 0
        }
        
        if let sid = Int((json["shop_id"] as? String)!) {
            self.shop_id = sid
        } else {
            self.shop_id = 0
        }
        
        if let q1 = json["question1"] as? String! {
            self.question1 = q1
        } else {
            self.question1 = ""
        }
        
        if let q2 = json["question2"] as? String! {
            self.question2 = q2
        } else {
            self.question2 = ""
        }
        
        if let q3 = json["question3"] as? String! {
            self.question3 = q3
        } else {
            self.question3 = ""
        }
        
        if let q4 = json["question4"] as? String! {
            self.question4 = q4
        } else {
            self.question4 = ""
        }
        
        if let q5 = json["question5"] as? String! {
            self.question5 = q5
        } else {
            self.question5 = ""
        }
        
        if let s1 = Bool((json["star1"] as? String)!) {
            self.star1 = s1
        } else {
            self.star1 = false
        }
        
        if let s2 = Bool((json["star2"] as? String)!) {
            self.star2 = s2
        } else {
            self.star2 = false
        }
        
        if let s3 = Bool((json["star3"] as? String)!) {
            self.star3 = s3
        } else {
            self.star3 = false
        }
        
        if let s4 = Bool((json["star4"] as? String)!) {
            self.star4 = s4
        } else {
            self.star4 = false
        }
        
        if let s5 = Bool((json["star5"] as? String)!) {
            self.star5 = s5
        } else {
            self.star5 = false
        }
        
        if let t = Bool((json["timer"] as? String)!) {
            self.timer = t
        } else {
            self.timer = false
        }
    }
}
