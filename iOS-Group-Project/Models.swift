//
//  Models.swift
//  iOS-Group-Project
//
//  Created by student on 4/25/22.
//

import Foundation


struct Wearable{
    public var id:Int16;
    public let name:String;
    public let brand:String;
    public let year:Int16;
//    public var colors:Set<String>;
    public var price:Int16;
    


}
struct Person{
    public var firstName:String;
    public var lastName:String;
    public var email:String;
    public var username:String;
    public var password:String;
    
}

class UserSingleton{
    public var user:User?
    
    static var _UserSingleton:UserSingleton = {
        let variable = UserSingleton()
        
        
        return variable
    }()
    private init(){
        self.user = nil
    }
}
