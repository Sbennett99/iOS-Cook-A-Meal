//
//  LoginVC.swift
//  iOS-Group-Project
//
//  Created by student on 4/21/22.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLBL.text = ""
        var index = 0.0
        let text = "🛑One-Stop"
        for i in text{
            Timer.scheduledTimer(withTimeInterval: 0.2 * index, repeats: false) { (animateText) in
                self.titleLBL.text?.append(i)
            }
            index = index+1
            
        }

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
