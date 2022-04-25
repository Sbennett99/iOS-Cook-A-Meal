//
//  RegisterVC.swift
//  iOS-Group-Project
//
//  Created by student on 4/21/22.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var registerNameTF: UITextField!
    
    @IBOutlet weak var errorDisplay: UITextView!
    
    @IBOutlet weak var registerPassTF: UITextField!
    
    @IBAction func registerBtn(_ sender: UIButton) {
        if let email = registerNameTF.text, let password = registerPassTF.text{
            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                if let err = error {
                    self.errorDisplay.text = err.localizedDescription
        }
                else{
                    self.performSegue(withIdentifier: "registerToTab", sender: self)
                }
        
    }
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
}
