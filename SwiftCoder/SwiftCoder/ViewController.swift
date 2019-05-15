//
//  ViewController.swift
//  SwiftCoder
//
//  Created by tecH on 15/05/19.
//  Copyright © 2019 vijayvir Singh. All rights reserved.
//
//https://benscheirman.com/2017/06/swift-json/
import UIKit
struct  SomeDstct {
    var  name : String
    var  age : Int
    var  className : String
    var  other : SomeOther
    struct SomeOther {
        var color : String
        var size : String
        var height : Int
    }
    
}
 extension SomeDstct.SomeOther : LeoSerializable {
    
}
extension SomeDstct : LeoSerializable {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let some = SomeDstct(name: "name",
                             age: 34,
                             className: "eeee",
                             other: SomeDstct.SomeOther(color: "d",
                                                        size: "dd",
                                                        height: 3232))
        
         let generator = LeoSwiftCoder().withTemplate(LeoSwiftCoder.CodeTemplate.Codeable)
         generator.leoClassMake(withName: "Temp", json: some.toJsonObect())
        
        
        
        let data = Data(some.toJsonString()!.utf8)

        let beer  = leoDecode(data ,type: Temp.self)

        print(leoEncodeString(beer))
       
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // try to read out a string array
               // let some = LeoSwiftCoder().withTemplate(LeoSwiftCoder.CodeTemplate.Codeable)
               // some.leoClassMake(withName: "Temp", json: json)
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        
        
     
        
     
      
//        let some = "jsonString"
//
//        let str = "{\"names\": [\"Bob\", \"Tim\", \"Tina\"]}"
//        let data = Data(str.utf8)
//
//
//        let jsonData = str.data(using: .utf8)!
//        let decoder = JSONDecoder()
//        let beer = try! decoder.decode(Temp.self, from: jsonData)
//
//
//
//        let some = Temp(from: <#T##Decoder#>)
        
    }


}

