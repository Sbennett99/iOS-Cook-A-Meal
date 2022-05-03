//
//  SearchDetailVC.swift
//  iOS-Group-Project
//
//  Created by Nomula,Jawahar Reddy on 4/25/22.
//

import UIKit

class SearchDetailVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let deg:Shoe = shoes![indexPath.row]
        
        if let degCell = cell as? SearchShoeCell{
            degCell.shoeName.text = deg.name
            degCell.shoeBrand.text = deg.brand
            degCell.shoeYear.text = String(deg.year)
            degCell.shoeImg.image = UIImage(named: "\(deg.name!)\(deg.brand!)\(deg.year).jpg")
            
        }
        
        return cell
    }
    
    var shoes:[Shoe]?
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsTbl.dataSource = self
        resultsTbl.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Detail", sender: indexPath)
    }

    
    
    @IBOutlet weak var resultsTbl: UITableView!
    
   
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
                        
                        let shoe = shoes![ip.row]
                        
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
                }
            default: break
            }
        }
    }
    

}
