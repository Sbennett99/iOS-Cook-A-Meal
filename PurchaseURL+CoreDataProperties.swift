//
//  PurchaseURL+CoreDataProperties.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//
//

import Foundation
import CoreData


extension PurchaseURL {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PurchaseURL> {
        return NSFetchRequest<PurchaseURL>(entityName: "PurchaseURL")
    }

    @NSManaged public var url: String?
    @NSManaged public var purl: Shoe?
    
    class func createOrFetchShoe(urlIn: String, in context: NSManagedObjectContext) -> PurchaseURL{
        
        let request: NSFetchRequest<PurchaseURL> = PurchaseURL.fetchRequest()
        
        request.predicate = NSPredicate(format: "any name == %@", urlIn)
        
        do{
            
            let urls = try context.fetch(request)
            
            if urls.count != 0{
                return urls[0]
            }
        }catch{
            print(error)
        }
    
        let urlOut = PurchaseURL(context: context)
        urlOut.url = urlIn
        
        
        return urlOut
    }
}

extension PurchaseURL : Identifiable {

}
