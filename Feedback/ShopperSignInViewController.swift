//
//  ShopperSignInViewController.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShopperSignInViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var activationCode: UITextField!
    @IBOutlet weak var signInLabel: UIButton!
    
    @IBAction func signIn(_ sender: UIButton) {
        if isAnActivationCode {
            self.performSegue(withIdentifier: "shopperSignIn", sender: indexPath);
        } else {
            popup(title: "Sorry!", message: "It looks like the Activation Code or Company Name you entered does not exist.  Please try again.")
        }
    }
    
    // MARK: - Variables
    
    var isAnActivationCode: Bool = false
    var companyId: Int = 0 // this needs to be set!!
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "shopperSignIn" {
            let destinationNavigationController = segue.destination as! UINavigationController
            let shpvc = destinationNavigationController.topViewController as! ShopperHomePageViewController
            
            shpvc.companyID = companyID
        }
    }
    
    func popup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func checkIfEmpty() {
        var bool = false
        if companyName.text != "" && email.text != "" && password.text != "" {
            if (!(email.text?.characters.contains("@"))!) {
                popup(title: "Invlid Email", message: "Please use another email address and try again.")
            } else {
                
                let aCompany = switchSignInAlpha()
            }
        }
    }
    
    func switchSignInAlpha() -> Bool {
        hash = Hash().hash(string: activationCode.text)
        JsonParser.jsonClient.isAnActivationCode(name: companyName.text, activationCode: hash) {[weak self](isAnActivationCode) in
            self?.isAnActivationCode = isAnActivationCode
        }
        
        if isACompany {
            self.signInLabel.alpha = 1.0
        }
        return isACompany
    }
}

// MARK: - Text Field Extension

extension ShopperSignInViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.activeTextField = textField
        checkIfEmpty()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.activeTextField = textField
        checkIfEmpty()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField = textField
        textField.resignFirstResponder()
        checkIfEmpty()
        return true
    }
}
