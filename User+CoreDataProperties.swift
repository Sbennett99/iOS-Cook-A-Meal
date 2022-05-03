//
//  User+CoreDataProperties.swift
//  iOS-Group-Project
//
//  Created by student on 5/2/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var bio: String?
    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var shoes: NSSet?

}

// MARK: Generated accessors for shoes
extension User {

    @objc(addShoesObject:)
    @NSManaged public func addToShoes(_ value: Shoe)

    @objc(removeShoesObject:)
    @NSManaged public func removeFromShoes(_ value: Shoe)

    @objc(addShoes:)
    @NSManaged public func addToShoes(_ values: NSSet)

    @objc(removeShoes:)
    @NSManaged public func removeFromShoes(_ values: NSSet)
    
    class func createOrFetchUser(person: Person, in context: NSManagedObjectContext) -> User?{
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        request.predicate = NSPredicate(format: "any username == %i", person.username)
        
        do{
            
            let people = try context.fetch(request)
            
            if people.count != 0{
                return people[0]
            }
        }catch{
            print(error)
        }
        
        let user = User(context: context)
        if person.password != ""{
        user.username = person.username
        user.firstName = person.firstName
        user.lastName = person.lastName
        user.email = person.email
        user.password = person.password
        
        }else{
            return nil
        }
        
        
        return user
    }

}

extension User : Identifiable {

}
