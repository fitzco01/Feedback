//
//  API.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import Foundation

class JsonParser {
    
    static let jsonClient = JsonParser()
    
    func getMyReviews(shopID: Int, customerID: Int, _ completion: @escaping ([ReviewFinder]) -> ()) {
        let postString = "shopID=\(shopID)&customerId=\(customerID)"
        post(clientURLRequest("reviewForShop.php"), message: postString) { (success, object) in
            var reviews: [ReviewFinder] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["review"] as? [Dictionary<String, AnyObject>] {
                    for result in results {
                        if let review = ReviewFinder(json: result) {
                            reviews.append(review)
                        } else {
                            print(result)
                        }
                    }
                }
            }
            completion(reviews)
        }
    }
    
    func getMyQuestions(shopID: Int, _ completion: @escaping (QuestionFinder) -> ()) {
        let postString = "shopID=\(shopID)"
        post(clientURLRequest("questionsForCustomer.php"), message: postString) { (success, object) in
            var questions: [QuestionFinder] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["question"] as? [Dictionary<String, AnyObject>] {
                    for result in results {
                        if let question = QuestionFinder(json: result) {
                            questions.append(question)
                        } else {
                            print(result)
                        }
                    }
                }
            }
            completion(questions[0])
        }
    }
    
    func shopQuestions(shopID: Int, question1: String, question2: String, question3: String, question4: String, question5: String, star1: Bool, star2: Bool, star3: Bool, star4: Bool, star5: Bool, timer: Bool, _ completion: @escaping () -> ()) {
        let postString = "shopID=\(shopID)&question1=\(question1)&question2=\(question2)&question3=\(question3)&question4=\(question4)&question5=\(question5)&star1=\(star1)&star2=\(star2)&star3=\(star3)&star4=\(star4)&star5=\(star5)&timer=\(timer)"
        post(clientURLRequest("shopQuestions.php"), message: postString) { (success, object) in
            completion()
        }
    }
    
    func isACompany(shopName: String, email: String, hashedPassword: String, _ completion: @escaping (Bool) -> ()) {
        let postString = "shopName=\(shopName)&email=\(email)&password=\(hashedPassword)"
        post(clientURLRequest("isACompany.php"), message: postString) { (success, object) in
            var isACompany: Bool = false
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["company"] as? [Dictionary<String, AnyObject>] {
                    isACompany = results[0]
                }
            }
            completion(isACompany)
        }
    }
    
    func shopSignUp(shopName: String, email: String, hashedPassword: String, _ completion: @escaping (ShopFinder) -> ()) {
        let postString = "shopName=\(shopName)&email=\(email)&password=\(hashedPassword)"
        post(clientURLRequest("shopSignUp.php"), message: postString) { (success, object) in
            var shops: [ShopFinder] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["shop"] as? [Dictionary<String, AnyObject>] {
                    for result in results {
                        if let shop = ShopFinder(json: result) {
                            shops.append(shop)
                        } else {
                            print(result)
                        }
                    }
                }
            }
            completion(shops[0])
        }
    }
    
    func getMyReviews(shopID: Int, _ completion: @escaping ([ReviewFinder]) -> ()) {
        let postString = "shopID=\(shopID)"
        post(clientURLRequest("reviewForShop.php"), message: postString) { (success, object) in
            var reviews: [ReviewFinder] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["review"] as? [Dictionary<String, AnyObject>] {
                    for result in results {
                        if let review = ReviewFinder(json: result) {
                            reviews.append(review)
                        } else {
                            print(result)
                        }
                    }
                }
            }
            completion(reviews)
        }
    }
    
    func getMyStars(shopID: Int, _ completion: @escaping ([ReviewFinder]) -> ()) {
        let postString = "shopID=\(shopID)"
        post(clientURLRequest("starsForShop.php"), message: postString) { (success, object) in
            var stars: [Int] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["stars"] as? [Dictionary<String, AnyObject>] {
                    stars[0] = results[0]
                    stars[1] = results[1]
                }
            }
            completion(stars)
        }
    }
    
    func shopShoppers(shopID: Int, _ completion: @escaping ([ShopperFinder]) -> ()) {
        let postString = "shopID=\(shopID)"
        post(clientURLRequest("shopShoppers.php"), message: postString) { (success, object) in
            var shoppers: [ShopperFinder] = []
            if let object = object as? Dictionary<String, AnyObject> {
                if let results = object["shoppers"] as? [Dictionary<String, AnyObject>] {
                    for result in results {
                        if let shop = ShopperFinder(json: result) {
                            shoppers.append(shop)
                        } else {
                            print(result)
                        }
                    }
                }
            }
            completion(shoppers)
        }
    }
    
    fileprivate func post(_ request: NSMutableURLRequest, message: String?, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request, method: "POST", message: message, completion: completion)
    }
    
    fileprivate func get(_ request: NSMutableURLRequest, message: String?, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request, method: "GET", message: message, completion: completion)
    }
    
    fileprivate func clientURLRequest(_ path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: URL(string: "http://104.237.138.210/connor/"+path)!)
        return request
    }
    
    fileprivate func dataTask(_ request: NSMutableURLRequest, method: String, message: String?, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> (Int)) {
        request.httpMethod = method
        request.httpBody = message?.data(using: String.Encoding.utf8)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            let code = 0
            if let data = data {
                
                // MARK: - For debugging purposes
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                    code = response.statusCode
                } else {
                    completion(false, json as AnyObject?)
                    if let httpResponse = response as? HTTPURLResponse {
                        print("error \(httpResponse.statusCode)")
                        code = httpResponse.statusCode
                    }
                }
                
            }
        })  .resume()
        
        return code
    }
}
