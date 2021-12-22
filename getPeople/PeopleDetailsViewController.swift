//
//  PeopleDetailsViewController.swift
//  getPeople
//
//  Created by Maha saad on 18/05/1443 AH.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    
    var passedPerson : NSDictionary!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specisLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var brithLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = passedPerson["name"] as? String
        genderLabel.text = passedPerson["gender"] as? String
        brithLabel.text = passedPerson["birth_year"] as? String
        massLabel.text = passedPerson["mass"] as? String
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
