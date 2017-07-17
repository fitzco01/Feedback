//
//  ShoppersTableViewCell.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/16/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShoppersTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var activationCode: UILabel!
    
    // MARK: - Configuration
    
    func configure(_ shopper: ShopperFinder) {
        email.text = "\(shopper.email!)"
        activationCode.text = "\(shopper.activation_code!)"
    }
}
