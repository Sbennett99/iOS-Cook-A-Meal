//
//  RegisterVC.swift
//  iOS-Group-Project
//
//  Created by student on 4/21/22.
//

import UIKit
import CoreData

class RegisterVC: UIViewController {

    var fetchResultsController:NSFetchedResultsController<User>?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.fetchStudentRecords()
        
        
        
    }
    
    @IBOutlet weak var usernameTxt: UITextField!
    
    
    @IBOutlet weak var firstNameTxt: UITextField!
    
    
    @IBOutlet weak var lastNameTxt: UITextField!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    @IBOutlet weak var passwordConfTxt: UITextField!
    
    
    var outUser:User?
    @IBAction func registerBtn(_ sender: UIButton) {
        
        if let uname = usernameTxt.text,let fname = firstNameTxt.text, let lname = lastNameTxt.text,let eml = emailTxt.text,let pwd = passwordTxt.text, let pwdC = passwordConfTxt.text{
            
            if uname != "" && eml != "" && pwd != ""{
                if(pwd == pwdC){
                    let u = User.createOrFetchUser(person: Person(firstName: "", lastName: "", email: "", username: uname, password: ""), in: AppDelegate.context)
                    if(u == nil){
                        let user = User.createOrFetchUser(person: Person(firstName: fname, lastName: lname, email: eml, username: uname, password: pwd), in: AppDelegate.context)
                        try? AppDelegate.context.save()
                        outUser = user
                        performSegue(withIdentifier: "RegisterLogin", sender: sender)
                    }else{
                        errorLbl.text = "Username Taken"
                    }
                }else{
                    errorLbl.text = "Password and Confirmation do not match"
                }
            }else{
                errorLbl.text = "Required Field is blank"
            }
            
        }
        
    }

    
    @IBOutlet weak var errorLbl: UILabel!
    
    private func fetchStudentRecords(){
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            
            try self.fetchResultsController?.performFetch()
        }catch{
            print(error)
        }
        
       
    }
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "RegisterLogin"{
            UserSingleton._UserSingleton.user = outUser
        }
    }
    


}
