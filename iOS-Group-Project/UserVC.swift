//
//  UserVC.swift
//  iOS-Group-Project
//
//  Created by Nomula,Jawahar Reddy on 4/25/22.
//

import UIKit

class UserVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var UserDP: UIImageView!
    
    
    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var userEmailID: UILabel!
    
    
    @IBOutlet weak var userFN: UILabel!
    
    @IBOutlet weak var userLN: UILabel!
    
    @IBOutlet weak var userBioTextField: UITextView!
    
    
    @IBOutlet weak var userFavImage: UIImageView!
    
    @IBOutlet weak var userFavShoeName: UILabel!
    
    
    @IBOutlet weak var userFavShoeBrandName: UILabel!
    
    
    @IBOutlet weak var userFavShoeColor: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
