//
//  UserVC.swift
//  iOS-Group-Project
//
//  Created by Nomula,Jawahar Reddy on 4/25/22.
//

import UIKit

class UserVC: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    var user = UserSingleton._UserSingleton.user!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.shoes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let deg:Shoe = user.shoes?.allObjects[indexPath.row]  as! Shoe
        
        if let degCell = cell as? ShoeCell{
            degCell.shoeName.text = deg.name
            degCell.shoeBrand.text = deg.brand
            degCell.shoeYear.text = String(deg.year)
            degCell.shoeImg.image = UIImage(named: "\(deg.name!)\(deg.brand!)\(deg.year)")
            
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDP.image = UIImage(named: "userImage.jpg")
        userID.text = user.username
        userEmailID.text = user.email ?? ""
        userFN.text = user.firstName ?? ""
        userLN.text = user.lastName ?? ""
        favTbl.dataSource = self
        favTbl.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Detail", sender: indexPath)
    }


    @IBOutlet weak var UserDP: UIImageView!
    
    
    @IBOutlet weak var userID: UILabel!
    
    @IBOutlet weak var userEmailID: UILabel!
    
    
    @IBOutlet weak var userFN: UILabel!
    
    @IBOutlet weak var userLN: UILabel!
    
    @IBOutlet weak var userBioTextField: UITextView!
    
    
    @IBOutlet weak var favTbl: UITableView!
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
        if let identifier = segue.identifier{
            
            switch identifier{
                
            case "Detail":
                if let destVC = segue.destination as? DetailShoeVC{
                    
                    if let ip = sender as? IndexPath{
                        
                        let shoe = user.shoes?.allObjects[ip.row] as! Shoe
                        
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
                        destVC.detailshoeImgView.image = UIImage(named: "\(shoe.name!)\(shoe.brand!)\(shoe.year).jpg")
                        
                    }
                }
            default: break
            }
        }
    }
        
        
    
    

}
