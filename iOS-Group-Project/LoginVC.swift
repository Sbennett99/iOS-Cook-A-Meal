//
//  LoginVC.swift
//  iOS-Group-Project
//
//  Created by student on 4/21/22.
//

import UIKit
import CoreData

class LoginVC: UIViewController {
    
    var fetchResultsController:NSFetchedResultsController<User>?
    @IBOutlet weak var titleLBL: UILabel!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        if let uname = usernameTF.text, let pwd = passwordTF.text{
            if uname != "" && pwd != ""{
                let user:User? = User.createOrFetchUser(person: Person(firstName: "", lastName:"", email: "", username: uname, password: ""), in: AppDelegate.context)
                if user != nil{
                    if(user?.password == pwd){
                        userOut = user
                        performSegue(withIdentifier: "LoginUser", sender: sender)
                    }else{
                        invalTxt.isHidden = false
                    }
                }else{
                    invalTxt.isHidden = false
                }
            }
        }
        
        
        
    }
    
    @IBOutlet weak var invalTxt: UILabel!
    var userOut:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here")
        self.fetchStudentRecords()
        titleLBL.text = ""
        //var index = 0.0
        //let text = "🛑One-Stop"
//        for i in text{
//            Timer.scheduledTimer(withTimeInterval: 0.2 * index, repeats: false) { (animateText) in
//                self.titleLBL.text?.append(i)
//            }
//            index = index+1
//
        }

        // Do any additional setup after loading the view.
    
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
        
        if segue.identifier == "LoginUser"{
            UserSingleton._UserSingleton.user = userOut
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
