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
        let defaults = UserDefaults.standard
        let shopID = defaults.object(forKey: "shop_id") as? Int
        
        let s1 = getStarBoolFromSwitch(index: star1.selectedSegmentIndex)
        let s2 = getStarBoolFromSwitch(index: star2.selectedSegmentIndex)
        let s3 = getStarBoolFromSwitch(index: star3.selectedSegmentIndex)
        let s4 = getStarBoolFromSwitch(index: star4.selectedSegmentIndex)
        let s5 = getStarBoolFromSwitch(index: star5.selectedSegmentIndex)
        let t = timer.isOn
        
        JsonParser.jsonClient.shopQuestions(shopID: shopID, question1: question1.text, question2: question2.text, question3: question3.text, question4: question4.text, question5: question5.text, star1: s1, star2: s2, star3: s3, star4: s4, star5: s5, timer: t) {[weak self] in
        }
        
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func addShopper(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let shopName = defaults.object(forKey: "shopName") as? String
        let code = Hash().codeGenerator(length: 7)
        
        print(code, shopName)
        // send email with activation code and link to app!!
    }
    
    // MARK: - Variables
    
    var shoppers: [ShopperFinder] = []
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let shopID = defaults.object(forKey: "shop_id") as? Int
        
        JsonParser.jsonClient.shopShoppers(shopID: shopID) {[weak self](myShoppers) in
            
            self?.shoppers = myShoppers

            DispatchQueue.main.async(execute: {
                self?.shoppersTable.reloadData()
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
    
    func getStarBoolFromSwitch(index: Int) -> Bool {
        switch index {
        case 1:
            return true
        case 2:
            return true
        case 3:
            return false
        default:
            print("ERROR: Switch out of range")
            return false
        }
    }
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

// MARK: - TableView Extension

extension ShopSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppers", for: indexPath) as! ShoppersTableViewCell
        
        let shop = shoppers[(indexPath as NSIndexPath).row]
        cell.configure(shop)
        
        return cell
    }
}
