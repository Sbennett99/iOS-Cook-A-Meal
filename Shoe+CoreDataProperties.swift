//
//  Shoe+CoreDataProperties.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//
//

import Foundation
import CoreData
public var shoeIDCounter:Int = 10000

extension Shoe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shoe> {
        return NSFetchRequest<Shoe>(entityName: "Shoe")
    }

    @NSManaged public var brand: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Int16
    @NSManaged public var year: Int16
    @NSManaged public var shoeID: Int16
    @NSManaged public var colors: NSSet?
    @NSManaged public var purls: NSSet?
    @NSManaged public var shoe: NSSet?

}

// MARK: Generated accessors for colors
extension Shoe {

    @objc(addColorsObject:)
    @NSManaged public func addToColors(_ value: Color)

    @objc(removeColorsObject:)
    @NSManaged public func removeFromColors(_ value: Color)

    @objc(addColors:)
    @NSManaged public func addToColors(_ values: NSSet)

    @objc(removeColors:)
    @NSManaged public func removeFromColors(_ values: NSSet)

    @objc(addPurlsObject:)
    @NSManaged public func addToPurls(_ value: PurchaseURL)

    @objc(removePurlsObject:)
    @NSManaged public func removeFromPurls(_ value: PurchaseURL)

    @objc(addPurls:)
    @NSManaged public func addToPurls(_ values: NSSet)

    @objc(removePurls:)
    @NSManaged public func removeFromPurls(_ values: NSSet)

    @objc(addShoeObject:)
    @NSManaged public func addToShoe(_ value: User)

    @objc(removeShoeObject:)
    @NSManaged public func removeFromShoe(_ value: User)

    @objc(addShoe:)
    @NSManaged public func addToShoe(_ values: NSSet)

    @objc(removeShoe:)
    @NSManaged public func removeFromShoe(_ values: NSSet)

    class func createOrFetchShoe(wearable: Wearable, in context: NSManagedObjectContext) -> Shoe{
        
        let request: NSFetchRequest<Shoe> = Shoe.fetchRequest()
        
        request.predicate = NSPredicate(format: "any shoeID == %i", wearable.id)
        
        do{
            
            let shoes = try context.fetch(request)
            
            if shoes.count != 0{
                return shoes[0]
            }
        }catch{
            print(error)
        }
    
        let shoe = Shoe(context: context)
        shoe.shoeID = Int16(shoeIDCounter)
        shoe.name = wearable.name
        shoe.brand = wearable.brand
        shoe.year = wearable.year
        shoe.price = wearable.price
        
        shoeIDCounter+=1
        
        return shoe
    }
    
}

extension Shoe : Identifiable {

}
