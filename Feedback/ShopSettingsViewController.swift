//
//  ShopSettingsViewController.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShopSettingsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var question1: UITextField!
    @IBOutlet weak var star1: UISegmentedControl!
    @IBOutlet weak var question2: UITextField!
    @IBOutlet weak var star2: UISegmentedControl!
    @IBOutlet weak var question3: UITextField!
    @IBOutlet weak var star3: UISegmentedControl!
    @IBOutlet weak var question4: UITextField!
    @IBOutlet weak var star4: UISegmentedControl!
    @IBOutlet weak var question5: UITextField!
    @IBOutlet weak var star5: UISegmentedControl!
    @IBOutlet weak var timer: UISwitch!
    @IBOutlet weak var shoppersTable: UITableView!
    
    @IBAction func save(_ sender: UIButton) {
        // API call to create/edit questions table!!
        
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

// MARK: - Text Field Extension

extension ShopSettingsViewController: UITextFieldDelegate {
    
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
