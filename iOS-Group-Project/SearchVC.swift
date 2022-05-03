//
//  SearchVC.swift
//  iOS-Group-Project
//
//  Created by Nomula,Jawahar Reddy on 4/25/22.
//

import UIKit
import CoreData

class SearchVC: UIViewController{
    var nike = false
    var adidas = false
    var puma = false
    
    
    var fetchResultsController:NSFetchedResultsController<Shoe>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchStudentRecords()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addShoe(_ sender: Any) {
        self.performSegue(withIdentifier: "addShoe", sender: self)
    }
    
    @IBAction func searchField(_ sender: UITextField) {
    }
    
    @IBAction func SearchButton(_ sender: UIButton) {
        
        
    }
    @IBOutlet weak var searchFilterLabel: UILabel!
    
    
    @IBAction func SearchNike(_ sender: UIButton) {
        nike = !nike
        
        
        if nike{
            nikeCheckbox.text = "🟩"
        }else{
            nikeCheckbox.text = "⬜️"
        }
    }
    
    
    @IBAction func searchRunning(_ sender: UIButton) {
        // not implemented
    }
    
    @IBAction func searchAdidas(_ sender: UIButton) {
        adidas = !adidas
        
        
        if adidas{
            adidasCheckbox.text = "🟩"
        }else{
            adidasCheckbox.text = "⬜️"
        }
    }
    
    
    @IBAction func searchHiking(_ sender: UIButton) {
        // not implemented
    }
        
    
    @IBAction func searchPuma(_ sender: UIButton) {
        puma = !puma
        
        
        if puma{
            pumaCheckbox.text = "🟩"
        }else{
            pumaCheckbox.text = "⬜️"
        }
    }
    
    
    @IBAction func searchWorkout(_ sender: UIButton) {
        // not implemented
    }
        
    @IBOutlet weak var nikeCheckbox: UILabel!
    
    @IBOutlet weak var adidasCheckbox: UILabel!
    
    
    @IBOutlet weak var pumaCheckbox: UILabel!
    
    
    private func fetchStudentRecords(){
        
        let request: NSFetchRequest<Shoe> = Shoe.fetchRequest()
        
        
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
    }
    

}
