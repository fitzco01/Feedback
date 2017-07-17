//
//  ShopperHomePageViewController.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShopperHomePageViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var timer: UIButton!
    
    @IBAction func startTimer(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question1Answer: UITextView!
    @IBOutlet weak var question1StarView: UIView!
    @IBOutlet var question1Stars: [UIButton]!
    
    @IBAction func question1StarAction(_ sender: UIButton) {
        question1StarsVar = sender.tag
    }
    
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question2Answer: UITextView!
    @IBOutlet weak var question2StarView: UIView!
    @IBOutlet var question2Stars: [UIButton]!
    
    @IBAction func question2StarAction(_ sender: UIButton) {
        question2StarsVar = sender.tag
    }
    
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question3Answer: UITextView!
    @IBOutlet weak var question3StarView: UIView!
    @IBOutlet var question3Stars: [UIButton]!
    
    @IBAction func question3StarAction(_ sender: UIButton) {
        question3StarsVar = sender.tag
    }
    
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question4Answer: UITextView!
    @IBOutlet weak var question4StarView: UIView!
    @IBOutlet var question4Stars: [UIButton]!
    
    @IBAction func question4StarAction(_ sender: UIButton) {
        question4StarsVar = sender.tag
    }
    
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question5Answer: UITextView!
    @IBOutlet weak var question5StarView: UIView!
    @IBOutlet var question5Stars: [UIButton]!
    
    @IBAction func question5StarAction(_ sender: UIButton) {
        question5StarsVar = sender.tag
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        
        JsonParser.jsonClient.submitReview(customerID: customerID, shopID, shopID, comment1: question1Answer.text, comment2: question2Answer.text, comment3: question3Answer.text, comment4: question4Answer.text, comment5: question5Answer.text, star1: question1Stars, star2: question2Stars, star3: question3Stars, star4: question4Stars, star5: question5Stars, timer: timerDuration, date: result) {[weak self] in
            
            DispatchQueue.main.async(execute: {
                reset()
                popup(title: "Thank You!", message: "We appreciate your continued support!")
            })
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Are you sure you want to log out?", message: "You will need to log in again with your activation code in order to leave another review.", preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            
            reset()
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
        
        let no = UIAlertAction(title: "No", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(yes)
        alertController.addAction(no)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Variables
    
    var isATimer: Bool = false
    var timerDuration: Double = 0.0
    var question1Var: String = ""
    var question1AnswerVar: String = ""
    var question1StarsVar: Int = 0
    var isQuestion1Stars: Bool = false
    var question2Var: String = ""
    var question2AnswerVar: String = ""
    var question2StarsVar: Int = 0
    var isQuestion2Stars: Bool = false
    var question3Var: String = ""
    var question3AnswerVar: String = ""
    var question3StarsVar: Int = 0
    var isQuestion3Stars: Bool = false
    var question4Var: String = ""
    var question4AnswerVar: String = ""
    var question4StarsVar: Int = 0
    var isQuestion4Stars: Bool = false
    var question5Var: String = ""
    var question5AnswerVar: String = ""
    var question5StarsVar: Int = 0
    var isQuestion5Stars: Bool = false
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        // get the information for how to fill out the screen dynamically!!
        JsonParser.jsonClient.getMyQuestions(shopID: shopID) {[weak self](myQuestions) in
            self?.isATimer = myQuestions.timer
            self?.question1Var = myQuestions.question1
            self?.question2Var = myQuestions.question2
            self?.question3Var = myQuestions.question3
            self?.question4Var = myQuestions.question4
            self?.question5Var = myQuestions.question5
            self?.isQuestion1Stars = myQuestions.star1
            self?.isQuestion2Stars = myQuestions.star2
            self?.isQuestion3Stars = myQuestions.star3
            self?.isQuestion4Stars = myQuestions.star4
            self?.isQuestion5Stars = myQuestions.star5
            
            
            DispatchQueue.main.async(execute: {
                if self?.isATimer == false {
                    hideItem(view: timer)
                }
                if self?.question1 = "" {
                    hideItem(view: question1)
                    hideItem(view: question1Answer)
                }
                if self?.question2 = "" {
                    hideItem(view: question2)
                    hideItem(view: question2Answer)
                }
                if self?.question3 = "" {
                    hideItem(view: question3)
                    hideItem(view: question3Answer)
                }
                if self?.question4 = "" {
                    hideItem(view: question4)
                    hideItem(view: question4Answer)
                }
                if self?.question5 = "" {
                    hideItem(view: question5)
                    hideItem(view: question5Answer)
                }
                if self?.isQuestion1Stars = false {
                    hideItem(view: question1StarView)
                    hideItem(view: question1Stars)
                }
                if self?.isQuestion2Stars = false {
                    hideItem(view: question2StarView)
                    hideItem(view: question2Stars)
                }
                if self?.isQuestion3Stars = false {
                    hideItem(view: question3StarView)
                    hideItem(view: question3Stars)
                }
                if self?.isQuestion4Stars = false {
                    hideItem(view: question4StarView)
                    hideItem(view: question4Stars)
                }
                if self?.isQuestion5Stars = false {
                    hideItem(view: question5StarView)
                    hideItem(view: question5Stars)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func hideItem(view: UIView) {
        stackView.removeArrangedSubview(view)
    }
    
    func reset() {
        timerDuration = 0.0
        question1AnswerVar = ""
        question1StarsVar = 0
        question2AnswerVar = ""
        question2StarsVar = 0
        question3AnswerVar = ""
        question3StarsVar = 0
        question4AnswerVar = ""
        question4StarsVar = 0
        question5AnswerVar = ""
        question5StarsVar = 0
        
        question1Answer.text = ""
        question2Answer.text = ""
        question3Answer.text = ""
        question4Answer.text = ""
        question5Answer.text = ""
        question1Stars.image = UIImage(named: "blank_star")
        question2Stars.image = UIImage(named: "blank_star")
        question3Stars.image = UIImage(named: "blank_star")
        question4Stars.image = UIImage(named: "blank_star")
        question5Stars.image = UIImage(named: "blank_star")
    }
    
    func popup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - Text Field Extension

extension ShopperHomePageViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.activeTextField = textField
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.activeTextField = textField
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField = textField
        textField.resignFirstResponder()
        return true
    }
}
