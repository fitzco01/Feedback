//
//  ShopHomePageViewController.swift
//  Feedback
//
//  Created by Connor Fitzpatrick on 7/15/17.
//  Copyright © 2017 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class ShopHomePageViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var weeklystar1: UIImageView!
    @IBOutlet weak var weeklystar2: UIImageView!
    @IBOutlet weak var weeklystar3: UIImageView!
    @IBOutlet weak var weeklystar4: UIImageView!
    @IBOutlet weak var weeklystar5: UIImageView!
    @IBOutlet weak var allstar1: UIImageView!
    @IBOutlet weak var allstar2: UIImageView!
    @IBOutlet weak var allstar3: UIImageView!
    @IBOutlet weak var allstar4: UIImageView!
    @IBOutlet weak var allstar5: UIImageView!
    
    @IBAction func logOut(_ sender: UIButton) {
        popup(title: "Log Out", message: "Are you sure you would like to log out?")
    }
    
    @IBOutlet weak var myReviewsTable: UITableView!
    
    // MARK: - Variables
    
    var myStars: [Int] = []
    var reviews: [ReviewFinder] = []
    var shopID: Int = 0 // need to set this!!
    
    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        JsonParser.jsonClient.getMyStars(shopID: shopID) {[weak self](mystars) in
            self?.myStars = mystars
            
            DispatchQueue.main.async(execute: {
                self.fillStars(mystars[0], mystars[1])
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
    
    func fillStars(weeklyAverage: Int, allTimeAverage: Int) {
        switch weeklyAverage {
        case 1:
            weeklystar1.image = UIImage(named: "star")
        case 2:
            weeklystar1.image = UIImage(named: "star")
            weeklystar2.image = UIImage(named: "star")
        case 3:
            weeklystar1.image = UIImage(named: "star")
            weeklystar2.image = UIImage(named: "star")
            weeklystar3.image = UIImage(named: "star")
        case 4:
            weeklystar1.image = UIImage(named: "star")
            weeklystar2.image = UIImage(named: "star")
            weeklystar3.image = UIImage(named: "star")
            weeklystar4.image = UIImage(named: "star")
        case 5:
            weeklystar1.image = UIImage(named: "star")
            weeklystar2.image = UIImage(named: "star")
            weeklystar3.image = UIImage(named: "star")
            weeklystar4.image = UIImage(named: "star")
            weeklystar5.image = UIImage(named: "star")
        default:
            print("No weekly reviews")
        }
        
        switch allTimeAverage {
        case 1:
            allstar1.image = UIImage(named: "star")
        case 2:
            allstar1.image = UIImage(named: "star")
            allstar2.image = UIImage(named: "star")
        case 3:
            allstar1.image = UIImage(named: "star")
            allstar2.image = UIImage(named: "star")
            allstar3.image = UIImage(named: "star")
        case 4:
            allstar1.image = UIImage(named: "star")
            allstar2.image = UIImage(named: "star")
            allstar3.image = UIImage(named: "star")
            allstar4.image = UIImage(named: "star")
        case 5:
            allstar1.image = UIImage(named: "star")
            allstar2.image = UIImage(named: "star")
            allstar3.image = UIImage(named: "star")
            allstar4.image = UIImage(named: "star")
            allstar5.image = UIImage(named: "star")
        default:
            print("No reviews")
        }
    }

    func popup(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        let no = UIAlertAction(title: "No", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
        }
        
        alertController.addAction(yes)
        alertController.addAction(no)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - TableView Extension

extension ShopHomePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewcell", for: indexPath) as! MyPlayerTableViewCell
        let review = reviews[(indexPath as NSIndexPath).row]
        cell.configure(review)
        
        return cell
    }
}
