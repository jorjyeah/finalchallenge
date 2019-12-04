//
//  ActivityViewController.swift
//  FinalChallengeApp
//
//  Created by Ni Wayan Bianka Aristania on 24/11/19.
//  Copyright © 2019 George Joseph Kristian. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var programTitle: String = ""
    let activityTaskArray = ["Play Doh", "Stomp Feet", "Point to Body Parts"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

}



extension ActivityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return activityTaskArray.count
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section  == 0 {
            return 218
        }
        else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "programTitleCell", for: indexPath) as! ProgramTitleTableViewCell
            cell.programTitleLabel.text = programTitle
            
            return  cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "activityTaskCell", for: indexPath) as! ActivityTaskTableViewCell
            cell.activityTaskLabel.text = activityTaskArray[indexPath.row]
        
            return  cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewCell", for: indexPath) as! AddActivityTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            performSegue(withIdentifier: "showActivityDetail", sender: self)
        } else if indexPath.section == 2{
            performSegue(withIdentifier: "showAddActivity", sender: self)
        }
    }
    
}
