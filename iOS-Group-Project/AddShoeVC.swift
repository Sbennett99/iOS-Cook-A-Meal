//
//  AddShoeVC.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//

import UIKit
import CoreData

class AddShoeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var shoeName: UITextField!
    
    @IBOutlet weak var shoeBrand: UITextField!
    
    @IBOutlet weak var shoeYear: UITextField!
    
    @IBOutlet weak var shoePrice: UITextField!
    
    var shoe:Shoe?
    
    @IBOutlet weak var outputLBL: UILabel!
    
    @IBAction func Submit(_ sender: Any) {
        
        if let name = self.shoeName.text, let brand = self.shoeBrand.text, let year:Int = Int(self.shoeYear.text!), let price:Int = Int(self.shoePrice.text!){
            
            if name != "" && brand != "" && year != 0 && price != 0{
                
                let wearable = Wearable(id: 0, name: name, brand: brand, year: Int16(year), price: Int16(price))
                
                self.shoe = Shoe.createOrFetchShoe(wearable: wearable, in: AppDelegate.context)
                
                try? AppDelegate.context.save()
                
                outputLBL.text = "Success"
                outputLBL.textColor = UIColor(named: "Green")
                
            }else{
                outputLBL.text = "Failure to add Shoe"
                outputLBL.textColor = UIColor(named: "Red")
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
