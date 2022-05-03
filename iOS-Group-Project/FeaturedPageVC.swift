//
//  FeaturedPageVC.swift
//  iOS-Group-Project
//
//  Created by Nomula,Jawahar Reddy on 4/25/22.
//

import UIKit
import CoreData

class FeaturedPageVC: UIViewController {
    var fetchResultsController:NSFetchedResultsController<Shoe>?
    private func fetchStudentRecords(){
        
        let request: NSFetchRequest<Shoe> = Shoe.fetchRequest()
        
        
        self.fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            
            try self.fetchResultsController?.performFetch()
        }catch{
            print(error)
        }
        
       
    }
    var shoes:[Shoe]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        
        FPImg1.addGestureRecognizer(tapGestureRecognizer)
        FPImg2.addGestureRecognizer(tapGestureRecognizer)
        FPImg3.addGestureRecognizer(tapGestureRecognizer)
        FPImg4.addGestureRecognizer(tapGestureRecognizer)
        FPImg5.addGestureRecognizer(tapGestureRecognizer)
        FPImg6.addGestureRecognizer(tapGestureRecognizer)
        FPImg7.addGestureRecognizer(tapGestureRecognizer)
        
        
        self.fetchStudentRecords()
        
        shoes = try! AppDelegate.context.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: "Shoe")) as! [Shoe]
        let shoes2 = shoes!
        
        FPImg1.image = UIImage(named: "\(shoes2[0].name!)\(shoes2[0].brand!)\(shoes2[0].year)")
        FPImg2.image = UIImage(named: "\(shoes2[1].name!)\(shoes2[1].brand!)\(shoes2[1].year)")
        FPImg3.image = UIImage(named: "\(shoes2[2].name!)\(shoes2[2].brand!)\(shoes2[2].year)")
        FPImg4.image = UIImage(named: "\(shoes2[3].name!)\(shoes2[3].brand!)\(shoes2[3].year)")
        FPImg5.image = UIImage(named: "\(shoes2[4].name!)\(shoes2[4].brand!)\(shoes2[4].year)")
        FPImg6.image = UIImage(named: "\(shoes2[5].name!)\(shoes2[5].brand!)\(shoes2[5].year)")
        FPImg7.image = UIImage(named: "\(shoes2[6].name!)\(shoes2[6].brand!)\(shoes2[6].year)")
        
            
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var FPImg1: UIImageView!
    
    @IBOutlet weak var FPImg2: UIImageView!
    
    @IBOutlet weak var FPImg3: UIImageView!
    
    @IBOutlet weak var FPImg4: UIImageView!
    
    @IBOutlet weak var FPImg5: UIImageView!
    
    @IBOutlet weak var FPImg6: UIImageView!
    
    @IBOutlet weak var FPImg7: UIImageView!
    
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "Detail", sender: sender)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier{
            
            switch identifier{
                
            case "Detail":
                if let destVC = segue.destination as? DetailShoeVC{
                    
                    
                    let send = sender as! UITapGestureRecognizer
                    let shoe = shoes![send.view!.tag]
                        
                    destVC.deatishoeyear.text = String(shoe.year)
                    destVC.detailshoeBrand.text = shoe.brand
                    destVC.detailshoeName.text = shoe.name
                    destVC.detailshoeprice.text = String(shoe.price)
                    destVC.detailshoecolor.text = "["
                    for color in shoe.colors?.allObjects as! [Color]{
                        destVC.detailshoecolor.text! += "\(color.name!), "
                    }
                    destVC.detailshoecolor.text! += "]"
                        
                    destVC.detailshoesites.text = "["
                    for url in shoe.purls?.allObjects as! [PurchaseURL]{
                        destVC.detailshoesites.text! += "\(url.url!), "
                    }
                    destVC.detailshoesites.text! += "]"
                    destVC.detailshoeImgView.image = UIImage(named: "\(shoe.name!)\(shoe.brand!)\(shoe.year)")
                        
                }
            default: break
            }
        }
        
        
        
    }
    

}
