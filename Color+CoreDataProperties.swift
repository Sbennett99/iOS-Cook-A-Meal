//
//  Color+CoreDataProperties.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//
//

import Foundation
import CoreData


extension Color {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Color> {
        return NSFetchRequest<Color>(entityName: "Color")
    }

    @NSManaged public var name: String?
    @NSManaged public var color: Shoe?
    
    class func createOrFetchShoe(colorName: String, in context: NSManagedObjectContext) -> Color{
        
        let request: NSFetchRequest<Color> = Color.fetchRequest()
        
        request.predicate = NSPredicate(format: "any name == %@", colorName)
        
        do{
            
            let colors = try context.fetch(request)
            
            if colors.count != 0{
                return colors[0]
            }
        }catch{
            print(error)
        }
    
        let color = Color(context: context)
        color.name = colorName
        
        
        return color
    }

}

extension Color : Identifiable {

}
