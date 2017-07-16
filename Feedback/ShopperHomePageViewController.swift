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
    
    @IBAction func startTimer(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var question1Answer: UITextView!
    @IBOutlet weak var question1StarView: UIView!
    @IBOutlet var question1Stars: [UIButton]!
    
    @IBAction func question1StarAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question2Answer: UITextView!
    @IBOutlet weak var question2StarView: UIView!
    @IBOutlet var question2Stars: [UIButton]!
    
    @IBAction func question2StarAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var question3Answer: UITextView!
    @IBOutlet weak var question3StarView: UIView!
    @IBOutlet var question3Stars: [UIButton]!
    
    @IBAction func question3StarAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question4: UILabel!
    @IBOutlet weak var question4Answer: UITextView!
    @IBOutlet weak var question4StarView: UIView!
    @IBOutlet var question4Stars: [UIButton]!
    
    @IBAction func question4StarAction(_ sender: UIButton) {
    }
    
    @IBOutlet weak var question5: UILabel!
    @IBOutlet weak var question5Answer: UITextView!
    @IBOutlet weak var question5StarView: UIView!
    @IBOutlet var question5Stars: [UIButton]!
    
    @IBAction func question5StarAction(_ sender: UIButton) {
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        // send to api and clear data!!
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        // popup are you sure!!
    }
    
    // MARK: - Variables
    
    var isATimer: Bool = true
    var timerDuration: Double = 0.0
    var question1: String = ""
    var question1Answer: String = ""
    var question1Stars: Int = 0
    var question2: String = ""
    var question2Answer: String = ""
    var question2Stars: Int = 0
    var question3: String = ""
    var question3Answer: String = ""
    var question3Stars: Int = 0
    var question4: String = ""
    var question4Answer: String = ""
    var question4Stars: Int = 0
    var question5: String = ""
    var question5Answer: String = ""
    var question5Stars: Int = 0
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        // get the information for how to fill out the screen dynamically!!
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
}
