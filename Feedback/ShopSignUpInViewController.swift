//
//  ShopSignUpInViewController.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShopSignUpInViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signInLabel: UIButton!
    @IBOutlet weak var signUpLabel: UIButton!
    
    @IBAction func SignIn(_ sender: UIButton) {
        isACompany = switchSignInAlpha()
        if isACompany {
            self.performSegue(withIdentifier: "companySignInUp", sender: indexPath);
        } else {
            popup(title: "Sorry!", message: "Some of the information you entered is incorrect.  Please try again.")
        }
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        canSignUp = switchSignUpAlpha()
        if canSignUp {
            // sign up API call!!
            // navigate to the next screen!!
        } else {
            popup(title: "Sorry!", message: "Please be sure to fill out all of the fields.  Emails must be valid, and passwords must be at least 6 characters.")
        }
    }
    
    // MARK: - Variables
    
    var isACompany = false
    var canSignUp = false
    
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
        
        if segue.identifier == "companySignInUp" {
            let destinationNavigationController = segue.destination as! UINavigationController
            let shpvc = destinationNavigationController.topViewController as! ShopHomePageViewController
            
            shpvc.companyName = companyName.text
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
            } else if (password.text?.characters.count)! < 6 {
                popup(title: "Invlid Password", message: "Please choose a password with at least 6 characters.")
            } else {
                
                let aCompany = switchSignInAlpha()
                
                if !aCompany {
                    switchSignUpAlpha()
                }
            }
        }
    }
    
    func switchSignInAlpha() -> Bool {
        hash = Hash().hash(string: password.text)
        JsonParser.jsonClient.isACompany(name: companyName.text, email: email.text, password: hash) {[weak self](isACompany) in
            self?.isACompany = isACompany
        }
        
        if isACompany {
            self.signInLabel.alpha = 1.0
        }
        return isACompany
    }
    
    func switchSignUpAlpha() -> Bool {
        if companyName.text != "" && email.text != "" && password.text != "" && (email.text?.characters.contains("@"))! && (password.text?.characters.count)! >= 6 {
            self.signUpLabel.alpha = 1.0
            self.canSignUp = true
        }
        
        return self.canSignUp
    }
}

// MARK: - Text Field Extension

extension ShopSignUpInViewController: UITextFieldDelegate {
    
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
