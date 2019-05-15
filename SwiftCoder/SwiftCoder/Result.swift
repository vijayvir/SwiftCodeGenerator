//
//  Result.swift
//  SwiftCoder
//
//  Created by tecH on 15/05/19.
//  Copyright © 2019 vijayvir Singh. All rights reserved.
//

import Foundation



class Temp : Codable {
    var serverData : [String: Any] = [:]
    var age : Int?
    var className : String?
    var name : String?
    var other : Other?
    enum CodingKeys: String, CodingKey {
        case age = "age"
        case name = "name"
        case other = "other"
        case className = "className"
    }
    required init(from decoder: Decoder) throws {
        let containerL = try decoder.container(keyedBy: CodingKeys.self)
        age = try containerL.decodeIfPresent(Int.self, forKey: .age)
        name = try containerL.decodeIfPresent(String.self, forKey: .name)
        other = try containerL.decodeIfPresent(Other.self, forKey: .other)
        className = try containerL.decodeIfPresent(String.self, forKey: .className)
    }
    class Other : Codable {
        var serverData : [String: Any] = [:]
        var color : String?
        var height : Int?
        var size : String?
        enum CodingKeys: String, CodingKey {
            case size = "size"
            case color = "color"
            case height = "height"
        }
        required init(from decoder: Decoder) throws {
            let containerL = try decoder.container(keyedBy: CodingKeys.self)
            size = try containerL.decodeIfPresent(String.self, forKey: .size)
            color = try containerL.decodeIfPresent(String.self, forKey: .color)
            height = try containerL.decodeIfPresent(Int.self, forKey: .height)
        }
    }
}


extension Temp.Other : LeoSerializable {
    
}
extension Temp : LeoSerializable {
    
}






//class Temp : Codable {
//
//    var names : [Names]?
//    enum CodingKeys: String, CodingKey {
//        case names = "names"
//    }
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        names = try values.decodeIfPresent([Names].self, forKey: .names)
//        
//        
//    }
//    
////    func encode(to encoder: Encoder) throws {
////        var container = encoder.container(keyedBy: CodingKeys.self)
////        var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .names)
////        try response.encode(self.bar, forKey: .bar)
////        try response.encode(self.baz, forKey: .baz)
////        try response.encode(self.friends, forKey: .friends)
////    }
//    
//    
//    
//    
//    class Names : Codable {
//        var serverData : String
//     
//        required init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            serverData = try values.decodeIfPresent(String.self, forKey: .names)
//        }
//
//    }
//}
//
//extension Temp : LeoSerializable{
//    
//}
