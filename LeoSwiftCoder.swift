//
//  LeoSwiftCoder.swift
//  Apex
//
//  Created by tecH on 05/02/19.
//  Copyright © 2019 vijayvir Singh. All rights reserved.
//

import Foundation

class LeoSwiftCoder {
    func leoClassMake(withName : String , json :Any) {
        switch json.self {
        case is [String : Any] :
            
            if let someJson = json as? [String : Any] {
                print("class \(withName) {")
                print("var serverData : [String: Any] = [:]")
                for key in someJson.keys {
                    print( "var \(key) : \(self.typeOf(send: someJson[key]! , key : key))?" )
                }
                print("init(dict: [String: Any]){")
                print(" self.serverData = dict \n ")
                
                for key in someJson.keys {
                    print( self.defineVariable(key :key , send: someJson[key]!) )
                    
                }
                print("}")
                print("}")
                for object in someJson.keys {
                    if let nextObject = someJson[object] as? [String : Any] {
                        self.leoClassMake(withName: object.capitalized, json: nextObject)
                    } else if let nextObject = someJson[object] as? [[String : Any]] {
                        if nextObject.count > 0 {
                            self.leoClassMake(withName: object.capitalized, json: nextObject.first!)
                        }
                    }
                    
                }
            }
        case is Int :
            print("Int")
        case is Array<Any> :
            print("Array")
        case is Dictionary<String, Any> :
            print("Dictionary")
        case is Bool :
            print("Bool")
        case is String :
            print("String")
            
        default:
            print("Any")
        }
        
    }
    
    func defineVariable(key :String, send :Any) -> String{
        switch send.self {
        case is [String : Any] :
            
            let some =  """
            if let object = dict[\"\(key)\"] as? [String : Any] {
            let some =  \(key.capitalized)(dict: object)
            self.\(key) = some }
            """
            
            return  some
            
        //"if let \(key) = dict[\"\(key)\"] as? \(key.capitalized) { \n self.\(key) = \(key) \n }"
        case is [[String : Any]] :
            
            let some =  """
            if let \(key) = dict[\"\(key)\"] as? [[String : Any]] {
            self.\(key) = []
            for object in \(key) {
            let some =  \(key.capitalized)(dict: object)
            self.\(key)?.append(some)
            
            }
            }
            """
            return  some
        case is Int :
            return "if let \(key) = dict[\"\(key)\"] as? Int { \n self.\(key) = \(key) \n }"
        case is Array<Any> :
            return  "if let \(key) = dict[\"\(key)\"] as? Array<Any> { \n self.\(key) = \(key) \n }"
        case is Dictionary<String, Any> :
            return  "if let \(key) = dict[\"\(key)\"] as?  Dictionary<String, Any> { \n self.\(key) = \(key) \n }"
        case is Bool :
            return  "if let \(key) = dict[\"\(key)\"] as? Bool { \n self.\(key) = \(key) \n }"
        case is String :
            return  "if let \(key) = dict[\"\(key)\"] as? String { \n self.\(key) = \(key) \n }"
            
        default:
            return "Any"
        }
        
    }
    func typeOf(send :Any , key : String? = nil ) -> String{
        switch send.self {
        case is [String : Any] :
            if (key != nil) {
                return "\(key!.capitalized)"
            } else {
                return "[String : Any]"
            }
        case is [[String : Any]] :
            if (key != nil) {
                return "[\(key!.capitalized)]"
            } else {
                return "[[String : Any]]"
            }
            
        case is Int :
            return "Int"
        case is Array<Any> :
            return "Array<Any>"
        case is Dictionary<String, Any> :
            return "Dictionary<String, Any>"
        case is Bool :
            return "Bool"
        case is String :
            return "String"
            
        default:
            return "Any"
        }
        
    }
    
}

